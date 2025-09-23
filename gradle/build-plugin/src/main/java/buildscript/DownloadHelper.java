package buildscript;

import org.asynchttpclient.AsyncCompletionHandler;
import org.asynchttpclient.Dsl;
import org.asynchttpclient.AsyncHttpClient;
import org.asynchttpclient.Response;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Unmarshaller;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DownloadHelper {

    public static final String ANSI_CL = "\u001B[0K";
    public static final String NIST_HOME = "https://cda-validation.nist.gov/";

    private static final DownloadHelper INSTANCE = new DownloadHelper();

    private final Unmarshaller unmarshaller;
    private final AsyncHttpClient asyncHttpClient;
    private final AtomicInteger sentRequests = new AtomicInteger(0);
    private final AtomicInteger receivedResponses = new AtomicInteger(0);
    private final AtomicInteger errors = new AtomicInteger(0);
    private final Set<String> knownUrls = new HashSet<>();
    private final List<String> pendingUrls = new ArrayList<>();
    private final Object lock = new Object();
    private final ExecutorService filePool = Executors.newSingleThreadExecutor();

    private DownloadHelper() {
        try {
            JAXBContext context = JAXBContext.newInstance(DocumentTypes.class);
            this.unmarshaller = context.createUnmarshaller();
            this.asyncHttpClient = Dsl.asyncHttpClient(
                    Dsl.config()
                            .setMaxRequestRetry(4)
                            .setConnectTimeout(Duration.ofSeconds(30))
                            .setReadTimeout(Duration.ofSeconds(30))
                            .setRequestTimeout(Duration.ofSeconds(30))
                            .build()
            );
        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize DownloadHelper", e);
        }
    }

    public static DownloadHelper getInstance() {
        return INSTANCE;
    }

    static String massageUrl(String url) {
        return url.replace("http://localhost:11080/", NIST_HOME)
                .replace("http://cda-validation.nist.gov:11079/", NIST_HOME);
    }

    synchronized void report() {
        var len = 100 * receivedResponses.get() / Math.max(sentRequests.get(), 1);
        var progress = "*".repeat(len) + ".".repeat(100 - len);
        var str = "\r" + progress + " :: " + receivedResponses.get() + "/" + sentRequests.get() + ANSI_CL + "\r";
        System.out.print(str);

        if (pendingUrls.isEmpty() && knownUrls.size() > 1000) {
            printlnclr("");
            printlnclr("Done");
            System.exit(errors.get());
        }
    }

    void curl(String url, File root) {
        synchronized (lock) {
            if (knownUrls.contains(url)) {
                return;
            }
            knownUrls.add(url);
            pendingUrls.add(url);
        }
        sentRequests.incrementAndGet();
        report();
        
        String[] urlParts = url.split("/");
        String[] dirParts = urlParts.length > 4 ? 
            Arrays.copyOfRange(urlParts, 3, urlParts.length - 1) : new String[0];
        File dir = new File(root, String.join("/", dirParts));
        dir.mkdirs();
        File outFile = new File(dir, urlParts[urlParts.length - 1]);
        
        String templateText = "Downloading... If this fails, run\n" +
                             "curl " + url + " > " + outFile.getAbsolutePath() + "\n";
        
        try {
            if (!outFile.exists() || templateText.equals(readFile(outFile))) {
                printlnclr("Curling " + url);
                writeFile(outFile, templateText);
                asyncHttpClient.prepareGet(url)
                        .execute(new AsyncCompletionHandler<Void>() {
                            @Override
                            public Void onCompleted(Response response) throws Exception {
                                String body = massageUrl(response.getResponseBody());
                                String processedBody = body.replace(NIST_HOME, "")
                                        .replace(String.join("/", dirParts) + "/", "");
                                writeFile(outFile, processedBody);
                                fetchDependencies(processedBody, url, root);
                                receivedResponses.incrementAndGet();
                                markUrlDone(url);
                                return null;
                            }

                            @Override
                            public void onThrowable(Throwable t) {
                                printlnclr("Could not download " + url);
                                t.printStackTrace();
                                receivedResponses.incrementAndGet();
                                errors.incrementAndGet();
                                markUrlDone(url);
                            }
                        });
            } else {
                filePool.execute(() -> {
                    try {
                        fetchDependencies(readFile(outFile), url, root);
                        receivedResponses.incrementAndGet();
                        markUrlDone(url);
                    } catch (Exception e) {
                        System.err.println("Error processing existing file: " + e.getMessage());
                    }
                });
            }
        } catch (Exception e) {
            System.err.println("Error in curl method: " + e.getMessage());
        }
    }

    private void fetchDependencies(String body, String url, File root) {
        if (url.endsWith(".sch")) {
            fetchSchematronResources(body, url, root);
        }
        if (url.endsWith(".xsd")) {
            fetchSchemaResources(body, url, root);
        }
        if (url.endsWith(".sch") || url.endsWith(".ent")) {
            fetchCodefiles(body, url, root);
        }
    }

    private void fetchCodefiles(String body, String url, File root) {
        Pattern pattern = Pattern.compile("document\\(['\"](.*)['\")]\\)");
        Matcher matcher = pattern.matcher(body);
        while (matcher.find()) {
            String newUrl = matcher.group(1);
            String calculated = newUrl.contains("/") ?
                    (NIST_HOME + newUrl) :
                    computeUrl(newUrl, url);
            curl(calculated, root);
        }
    }

    private void markUrlDone(String url) {
        synchronized (lock) {
            pendingUrls.remove(url);
        }
        report();
    }

    private void fetchSchematronResources(String body, String url, File root) {
        Pattern pattern = Pattern.compile("<!ENTITY .+ SYSTEM '(.+)'>");
        Matcher matcher = pattern.matcher(body);
        while (matcher.find()) {
            String newUrl = matcher.group(1);
            String calculated = computeUrl(newUrl, url);
            curl(calculated, root);
        }
    }

    private void fetchSchemaResources(String body, String url, File root) {
        Pattern pattern = Pattern.compile("include schemaLocation=\"(.+)\"");
        Matcher matcher = pattern.matcher(body);
        while (matcher.find()) {
            String newUrl = matcher.group(1);
            String calculated = computeUrl(newUrl, url);
            curl(calculated, root);
        }
    }

    private static String computeUrl(String newUrl, String url) {
        List<String> parts = new ArrayList<>(Arrays.asList(newUrl.split("/")));
        Collections.reverse(parts);
        String[] urlParts = url.split("/");
        List<String> oldParts = new ArrayList<>(Arrays.asList(urlParts).subList(0, urlParts.length - 1));
        
        while (!parts.isEmpty()) {
            String head = parts.remove(parts.size() - 1);
            if ("..".equals(head)) {
                if (!oldParts.isEmpty()) {
                    oldParts.remove(oldParts.size() - 1);
                }
            } else {
                oldParts.add(head);
            }
        }

        return String.join("/", oldParts);
    }

    synchronized void printlnclr(String input) {
        System.out.println(ANSI_CL + "\r" + input);
    }

    @SuppressWarnings("unused")
    void downloadFrom(File docTypesFile, File buildDir) {
        try {
            printlnclr("Starting...");
            DocumentTypes docTypes = (DocumentTypes) unmarshaller.unmarshal(docTypesFile);
            File srcDir = new File(buildDir, "generated/src/java/gov/nist/mu/validation");
            srcDir.mkdirs();

            File downloadRoot = new File(buildDir, "generated/prebundle");

            curl(NIST_HOME + "hitspValidation/schematron/skeleton1-5.xsl", downloadRoot);
            curl(NIST_HOME + "hitspValidation/schematron/schematron-Validator-report.xsl", downloadRoot);

            StringBuilder sb = new StringBuilder();
            sb.append("package gov.nist.mu.validation;\n\n")
              .append("/**\n")
              .append(" * Constants of all rulesets.\n")
              .append(" *\n")
              .append(" */\n")
              .append("public class Rulesets {\n\n")
              .append("    /**\n")
              .append("     * Stylesheet for schematron\n")
              .append("     */\n")
              .append("    public static final Stylesheet stylesheet = new Stylesheet(\"hitspValidation/schematron\", \"schematron-Validator-report.xsl\");\n");

            for (DocumentType documentType : docTypes.getDocumentType()) {
                String constName = StringUtils.capitalize(documentType.getId());
                String url = massageUrl(documentType.getValidation().getUrl().trim());
                String[] urlParts = url.split("/");

                sb.append(getConst(documentType, constName, urlParts));
                curl(url, downloadRoot);
            }

            sb.append("}");
            writeFile(new File(srcDir, "Rulesets.java"), sb.toString());
        } catch (Exception e) {
            System.err.println("Error in downloadFrom: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    private static String getConst(DocumentType documentType, String constName, String[] urlParts) {
        String clazz = "schema".equals(documentType.getValidation().getType()) ? "Schema" : "Schematron";
        String[] pathParts = Arrays.copyOfRange(urlParts, 3, urlParts.length - 1);
        return String.format(
                """
                            /**
                             * %s
                             * %s
                             */
                            public static final %s %s = new %s("%s", "%s");
                        
                        """,
                StringEscapeUtils.escapeHtml4(documentType.getDisplayName()),
                StringEscapeUtils.escapeHtml4(documentType.getDescription()),
                clazz,
                constName,
                clazz,
                String.join("/", pathParts),
                urlParts[urlParts.length - 1]
        );
    }

    private String readFile(File file) {
        try {
            return new String(java.nio.file.Files.readAllBytes(file.toPath()));
        } catch (Exception e) {
            return "";
        }
    }

    private void writeFile(File file, String content) {
        try {
            java.nio.file.Files.write(file.toPath(), content.getBytes());
        } catch (Exception e) {
            System.err.println("Failed to write file: " + file + " - " + e.getMessage());
        }
    }
}