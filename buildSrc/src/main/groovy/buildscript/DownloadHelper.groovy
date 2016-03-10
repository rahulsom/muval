package buildscript

import org.apache.commons.lang.StringUtils

import javax.xml.bind.JAXBContext
import javax.xml.bind.Unmarshaller
import java.util.concurrent.atomic.AtomicInteger
import groovy.util.logging.Slf4j
import com.ning.http.client.*


@Slf4j
@Singleton
class DownloadHelper {

    public static final String ANSI_CL = "\u001B[0K";

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

    String massageUrl(String url) {
        url.replace('http://localhost', 'http://cda-validation.nist.gov').
                replace('cda-validation.nist.gov:11079', 'cda-validation.nist.gov:11080')
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
        def dir = new File(root, urlParts[3..-2].join('/'))
        dir.mkdirs()
        def outFile = new File(dir, urlParts[-1])
        def templateText = """\
            Downloading... If this fails, run
            curl $url > ${outFile.absolutePath}
            """.stripIndent()
        if (!outFile.exists() || outFile.text == templateText) {
            outFile.text = templateText
            asyncHttpClient.prepareGet(url).
                    execute(new AsyncCompletionHandler<File>() {
                        @Override
                        public File onCompleted(Response response) throws Exception {
                            def body = massageUrl(response.responseBody)
                            outFile.text = body.replace('http://cda-validation.nist.gov:11080/', '').
                                    replace(urlParts[3..-2].join('/') + '/', '')
                            if (url.endsWith('.sch')) {
                                fetchSchematronResources(outFile.text, url, root)
                            }
                            if (url.endsWith('.xsd')) {
                                fetchSchemaResources(outFile.text, url, root)
                            }
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
            if (url.endsWith('.sch')) {
                fetchSchematronResources(outFile.text, url, root)
            }
            if (url.endsWith('.xsd')) {
                fetchSchemaResources(outFile.text, url, root)
            }
            receivedResponses.incrementAndGet()
            markUrlDone(url)
            outFile
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

    void printlnclr(String input) {
        println "${ANSI_CL}\r${input}"
    }

    @SuppressWarnings("GroovyUnusedDeclaration")
    void downloadFrom(File docTypesFile, File buildDir) {
        printlnclr "Starting..."
        def docTypes = unmarshaller.unmarshal(docTypesFile) as DocumentTypes
        def srcDir = new File(buildDir, 'generated/src/java/gov/nist/mu/validation')
        srcDir.mkdirs()
        def sb = new StringBuilder()
        sb.append """\
            package gov.nist.mu.validation;

            class Rulesets {
            """.stripIndent()

        docTypes.documentType.each { DocumentType documentType ->
            def constName = StringUtils.capitalise(documentType.id)
            def url = massageUrl(documentType.validation.url.trim())
            def urlParts = url.split('/')

            sb.append getConst(documentType, constName, urlParts)
            curl(url, new File(buildDir, "generated/prebundle"))
        }

        sb.append "}"
        new File(srcDir, 'Rulesets.java').text = sb.toString()
    }

    private String getConst(DocumentType documentType, String constName, String[] urlParts) {
        """\
            /**
             * ${documentType.displayName}
             * ${documentType.description}
             */
            public static final Ruleset ${constName} = new Ruleset("${urlParts[3..-2].join('/')}", "${urlParts[-1]}", "${documentType.validation.type}");

            """.stripIndent(8)
    }

    public static void main(String[] args) {
        assert args.length == 2
        DownloadHelper.instance.downloadFrom(new File(args[0]), new File(args[1]))
    }

}