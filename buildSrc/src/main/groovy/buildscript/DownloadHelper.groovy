package buildscript

import org.apache.commons.lang.StringEscapeUtils
import org.apache.commons.lang.StringUtils

import jakarta.xml.bind.JAXBContext
import jakarta.xml.bind.Unmarshaller
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicInteger
import groovy.util.logging.Slf4j
import com.ning.http.client.*


@Slf4j
@Singleton
class DownloadHelper {

    public static final String ANSI_CL = "\u001B[0K";
    public static final String NIST_HOME = 'http://cda-validation.nist.gov:11080/'

    JAXBContext context = JAXBContext.newInstance(DocumentTypes)
    Unmarshaller unmarshaller = context.createUnmarshaller()
    AsyncHttpClient asyncHttpClient = new AsyncHttpClient(
            new AsyncHttpClientConfig.Builder().
                    setMaxRequestRetry(4).
                    setAllowPoolingConnections(true).
                    setConnectTimeout(30000).
                    setReadTimeout(30000).
                    setRequestTimeout(30000).
                    build()
    )
    AtomicInteger sentRequests = new AtomicInteger(0)
    AtomicInteger receivedResponses = new AtomicInteger(0)
    AtomicInteger errors = new AtomicInteger(0)
    Set<String> knownUrls = [] as Set
    List<String> pendingUrls = []
    Object lock = new Object()
    ExecutorService filePool = Executors.newSingleThreadExecutor()

    String massageUrl(String url) {
        url.replace('http://localhost:11080/',  NIST_HOME).
                replace('http://cda-validation.nist.gov:11079/', NIST_HOME)
    }

    synchronized void report() {
        def len = 100 * receivedResponses.get() / sentRequests.get()
        def str = "\r" + '*' * len + '.' * (100 - len) + " :: ${receivedResponses.get()}/${sentRequests.get()}${ANSI_CL}\r"
        System.out.print str

        if (pendingUrls.isEmpty() && knownUrls.size() > 1000) {
            printlnclr ""
            printlnclr "Done"
            System.exit(errors.get())
        }
    }

    void curl(String url, File root) {
        synchronized (lock) {
            if (knownUrls.contains(url)) {
                return
            }
            knownUrls << url
            pendingUrls << url
        }
        sentRequests.incrementAndGet()
        report()
        def urlParts = url.split('/') as String[]
        def dirParts = urlParts.size() > 4 ? urlParts[3..-2] : []
        def dir = new File(root, dirParts.join('/'))
        dir.mkdirs()
        def outFile = new File(dir, urlParts[-1])
        def templateText = """\
            Downloading... If this fails, run
            curl $url > ${outFile.absolutePath}
            """.stripIndent()
        if (!outFile.exists() || outFile.text == templateText) {
            printlnclr "Curling $url"
            outFile.text = templateText
            asyncHttpClient.prepareGet(url).
                    execute(new AsyncCompletionHandler<File>() {
                        @Override
                        public File onCompleted(Response response) throws Exception {
                            def body = massageUrl(response.responseBody)
                            outFile.text = body.replace(NIST_HOME, '').
                                    replace(urlParts[3..-2].join('/') + '/', '')
                            fetchDependencies(outFile.text, url, root)
                            receivedResponses.incrementAndGet()
                            markUrlDone(url)
                            outFile
                        }

                        @Override
                        public void onThrowable(Throwable t) {
                            printlnclr "Could not download $url"
                            t.printStackTrace()
                            receivedResponses.incrementAndGet()
                            errors.incrementAndGet()
                            markUrlDone(url)
                        }
                    })
        } else {
            filePool.execute {
                fetchDependencies(outFile.text, url, root)
                receivedResponses.incrementAndGet()
                markUrlDone(url)
            }
        }
    }

    private void fetchDependencies(String body, String url, File root) {
        if (url.endsWith('.sch')) {
            fetchSchematronResources(body, url, root)
        }
        if (url.endsWith('.xsd')) {
            fetchSchemaResources(body, url, root)
        }
        if (url.endsWith('.sch') || url.endsWith('.ent')) {
            fetchCodefiles(body, url, root)
        }
    }

    private List<String> fetchCodefiles(String body, String url, File root) {
        body.findAll($/document\(['"](.*)['"]\)/$).each { match ->
            def newUrl = (match =~ $/document\(['"](.+)['"]\)/$)[0][1] as String
                def calculated = newUrl.contains('/') ?
                        (NIST_HOME + newUrl):
                        computeUrl(newUrl, url)
            curl calculated, root
        }
    }

    private void markUrlDone(String url) {
        synchronized (lock) {
            pendingUrls.remove(url)
        }
        report()
    }

    private void fetchSchematronResources(String body, String url, File root) {
        body.findAll($/<!ENTITY .+ SYSTEM '(.+)'>/$).each { match ->
            def newUrl = (match =~ $/SYSTEM '(.+)'>/$)[0][1]
            String calculated = computeUrl(newUrl, url)
            curl calculated, root
        }
    }

    private void fetchSchemaResources(String body, String url, File root) {
        body.findAll($/include schemaLocation=".+"/$).each { match ->
            def newUrl = (match =~ $/schemaLocation="(.+)"/$)[0][1]
            String calculated = computeUrl(newUrl, url)
            curl calculated, root
        }
    }

    private String computeUrl(String newUrl, String url) {
        def parts = (newUrl.split('/').toList() as List).reverse()
        def oldParts = url.split('/')[0..-2].toList() as List
        while (parts) {
            def head = parts.pop()
            if (head == '..') {
                oldParts.remove(oldParts.size() - 1)
            } else {
                oldParts.add(head)
            }
        }

        oldParts.join('/')
    }

    synchronized void printlnclr(String input) {
        println "${ANSI_CL}\r${input}"
    }

    @SuppressWarnings("GroovyUnusedDeclaration")
    void downloadFrom(File docTypesFile, File buildDir) {
        printlnclr "Starting..."
        def docTypes = unmarshaller.unmarshal(docTypesFile) as DocumentTypes
        def srcDir = new File(buildDir, 'generated/src/java/gov/nist/mu/validation')
        srcDir.mkdirs()

        def downloadRoot = new File(buildDir, "generated/prebundle")

        curl "${NIST_HOME}hitspValidation/schematron/skeleton1-5.xsl", downloadRoot
        curl "${NIST_HOME}hitspValidation/schematron/schematron-Validator-report.xsl", downloadRoot

        def sb = new StringBuilder()
        sb.append """\
            package gov.nist.mu.validation;

            public class Rulesets {

                /**
                 * Stylesheet for schematron
                 */
                public static final Stylesheet stylesheet = new Stylesheet("hitspValidation/schematron", "schematron-Validator-report.xsl");
            """.stripIndent()

        docTypes.documentType.each { DocumentType documentType ->
            def constName = StringUtils.capitalize(documentType.id)
            def url = massageUrl(documentType.validation.url.trim())
            def urlParts = url.split('/')

            sb.append getConst(documentType, constName, urlParts)
            curl(url, downloadRoot)
        }

        sb.append "}"
        new File(srcDir, 'Rulesets.java').text = sb.toString()
    }

    private String getConst(DocumentType documentType, String constName, String[] urlParts) {
        def clazz = documentType.validation.type == 'schema' ? 'Schema' : 'Schematron'
        """\
            /**
             * ${StringEscapeUtils.escapeHtml(documentType.displayName)}
             * ${StringEscapeUtils.escapeHtml(documentType.description)}
             */
            public static final ${clazz} ${constName} = new ${clazz}("${urlParts[3..-2].join('/')}", "${urlParts[-1]}");

            """.stripIndent(8)
    }

    public static void main(String[] args) {
        assert args.length == 2
        DownloadHelper.instance.downloadFrom(new File(args[0]), new File(args[1]))
    }

}
