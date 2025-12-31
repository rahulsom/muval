/*
 * This software was developed at the National Institute of Standards and Technology
 * by employees of the Federal Government in the course of their official duties.
 * Pursuant to title 17 Section 105 of the United States Code this software is not
 * subject to copyright protection and is in the public domain.
 *
 * The CDA Guideline Validator is an experimental system. NIST assumes no responsibility
 * whatsoever for its use by other parties, and makes no guarantees, expressed or implied,
 * about its quality, reliability, or any other characteristic. We would appreciate
 * acknowledgment if the software is used. This software can be redistributed and/or
 * modified freely provided that any derivative works bear some notice that they are
 * derived from it, and any modified versions bear some notice that they have been
 * modified.
 */
package gov.nist.mu.validation;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import lombok.extern.slf4j.Slf4j;
import jakarta.xml.bind.Unmarshaller;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.help.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.URIResolver;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author andrew.mccaffrey
 * @author rahul somasunderam
 */
@Slf4j
public class Validator {

    private static final Schema schemaLocation = Rulesets.Cdar2c32;
    private static final Stylesheet skeletonLocation = Rulesets.stylesheet;
    public static final String OUTPUT_OPTION = "output";
    public static final String INPUT_OPTION = "input";
    private static TransformerFactory factory = null;

    /**
     * Entrypoint for CLI.
     *
     * @param args command line args
     */
    public static void main(String[] args) {

        Options cliOptions = Validator.setCliOptions();
        CommandLine line = getCommandLine(args, cliOptions);
        if (line == null) {
            return;
        }

        if (printHelp(args, cliOptions, line)) return;

        FileInputStream file = getInputFile(line);
        if (file == null) {
            return;
        }

        Ruleset[] rulesets = {Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_v_2_5_c83_2_0};
        SchemaValidationErrorHandler errorHandler = new SchemaValidationErrorHandler();

        Document doc = Validator.validateWithSchema(file, errorHandler, schemaLocation);

        String[] results = new String[rulesets.length];
        for (int i = 0; i < rulesets.length; i++) {
            results[i] = Validator.validateWithSchematron(doc, rulesets[i], skeletonLocation, "errors");
        }

        Node[] messageList = getResultNodes(results);

        if (messageList == null) {
            return;
        }

        Document result = Validator.generateReport(doc, errorHandler, messageList);
        String output = Validator.xmlToString(result);
        String outputfilename = computeOutputFilename(line);
        writeOutput(output, outputfilename);
    }

    static final String[] phases =
            {"error", "errors", "manual", "note", "notes", "violation", "warning", "warnings"};

    /**
     * Validates a file with a schema.
     *
     * @param schema      the schema to validate against
     * @param file        the file to validate
     * @param schematrons the schematrons to validate against
     * @return the validation results
     */
    public static Results validate(Schema schema, InputStream file, Schematron... schematrons) {
        SchemaValidationErrorHandler errorHandler = new SchemaValidationErrorHandler();
        Document doc = Validator.validateWithSchema(file, errorHandler, schema);
        Results retval = new Results();
        for (Ruleset schematron : schematrons) {
            for (String phase : phases) {
                String result = Validator.validateWithSchematron(doc, schematron, skeletonLocation, phase);
                try {
                    JAXBContext jaxbContext = JAXBContext.newInstance(Results.class);
                    Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
                    Object unmarshal = unmarshaller.unmarshal(
                            new ByteArrayInputStream(result != null ? result.getBytes() : new byte[0])
                    );
                    Results resultsFromIteration = (Results) unmarshal;
                    retval.getValidationResults().addAll(resultsFromIteration.getValidationResults());
                } catch (JAXBException e) {
                    log.error("Error unmarshalling results", e);
                }
            }
        }

        return retval;
    }

    private static Node[] getResultNodes(String[] results) {
        Node[] retval = new Node[results.length];

        for (int i = 0; i < results.length; i++) {
            try {
                retval[i] = Validator.stringToDom(results[i]);
            } catch (SAXException | IOException | ParserConfigurationException ex) {
                log.error("Error parsing schematron result", ex);
                return null;
            }
        }

        return retval;
    }

    private static FileInputStream getInputFile(CommandLine line) {
        String input = line.getOptionValue(INPUT_OPTION);
        try {
            return new FileInputStream(input);
        } catch (FileNotFoundException e) {
            log.error("Input file '{}' not found", input, e);
            return null;
        }
    }

    private static boolean printHelp(String[] args, Options cliOptions, CommandLine line) {
        HelpFormatter formatter = HelpFormatter.builder().get();
        if (line.hasOption("help") || args.length == 0 || !line.hasOption(INPUT_OPTION)) {
            try {
                formatter.printHelp("java -jar Validator.jar", "", cliOptions, "", true);
            } catch (IOException e) {
                log.error("Error printing help", e);
            }
            log.info("Example: user@localhost:~/cdafiles> java -jar Validator.jar -input CCD.xml -output report.xml");
            return true;
        }
        return false;
    }

    private static CommandLine getCommandLine(String[] args, Options cliOptions) {
        CommandLineParser parser = new DefaultParser();
        CommandLine line = null;
        try {
            line = parser.parse(cliOptions, args);
        } catch (ParseException ex) {
            log.error("Error parsing command line arguments", ex);
        }
        return line;
    }

    private static String computeOutputFilename(CommandLine line) {
        String outputfilename;

        if (line.hasOption(OUTPUT_OPTION)) {
            outputfilename = line.getOptionValue(OUTPUT_OPTION);
        } else {
            String date = Validator.createDateOfTest();
            String time = Validator.createTimeOfTest().substring(0, 5);
            outputfilename = "validationResult" + date + time + ".xml";
        }
        return outputfilename;
    }

    private static void writeOutput(String output, String outputfilename) {
        try (FileWriter outputStream = new FileWriter(outputfilename)) {
            outputStream.write(output);
        } catch (IOException ex) {
            log.error("Error writing output to {}", outputfilename, ex);
        }
    }


    private static Document generateReport(Document doc, SchemaValidationErrorHandler errorHandler,
                                           Node[] messages) {

        Document result = null;
        DocumentBuilder builder;
        try {
            builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            result = builder.newDocument();
        } catch (ParserConfigurationException ex) {
            log.error("Error creating document builder", ex);
            System.exit(1);
        }

        Element report = result.createElement("Report");
        result.appendChild(report);

        int errorCount = errorHandler.getNumberErrors() + Validator.getMessageCount(messages);
        // int warningCount = warnings.getFirstChild().getChildNodes().getLength();

        Element header = Validator.createHeader(result, errorCount);
        report.appendChild(header);

        //if(errorHandler.hasErrors()) {
        Element schemaErrorReport = Validator.createSchemaErrorReport(result, errorHandler);
        report.appendChild(schemaErrorReport);
        //}

        if (messages != null) {
            for (Node message : messages) {
                report.appendChild(result.importNode(message.getFirstChild(), true));
            }
        }

        Element testObject = result.createElement("TestObject");

        if (doc != null) {
            testObject.appendChild(result.importNode(doc.getDocumentElement(), true));
        } else {
            testObject.setTextContent("Error: Could not read file to generate test object.  Verify it is valid XML.");
        }
        report.appendChild(testObject);
        return result;
    }

    private static Element createHeader(Document result, int errorCountInt) {

        Element reportHeader = result.createElement("ReportHeader");

        Element validationStatus = result.createElement("ValidationStatus");
        validationStatus.setTextContent("Complete");
        reportHeader.appendChild(validationStatus);

        Element serviceName = result.createElement("ServiceName");
        serviceName.setTextContent("Meaningful Use HITSP/C32 v2.5 Validation");
        reportHeader.appendChild(serviceName);

        Element dateOfTest = result.createElement("DateOfTest");
        dateOfTest.setTextContent(Validator.createDateOfTest());
        reportHeader.appendChild(dateOfTest);

        Element timeOfTest = result.createElement("TimeOfTest");
        timeOfTest.setTextContent(Validator.createTimeOfTest());
        reportHeader.appendChild(timeOfTest);

        Element resultOfTest = result.createElement("ResultOfTest");
        if (errorCountInt == 0)
            resultOfTest.setTextContent("Passed");
        else
            resultOfTest.setTextContent("Failed");
        reportHeader.appendChild(resultOfTest);

        Element errorCount = result.createElement("ErrorCount");
        errorCount.setTextContent(String.valueOf(errorCountInt));
        reportHeader.appendChild(errorCount);

        return reportHeader;
    }

    private static Element createSchemaErrorReport(Document doc, SchemaValidationErrorHandler errorHandler) {

        Element result = doc.createElement("Results");
        result.setAttribute("severity", "schemaViolation");
        result.setAttribute("specification", "cda_r2");
        if (errorHandler.hasErrors()) {
            for (String s : errorHandler.getErrors()) {
                Element issue = doc.createElement("issue");
                result.appendChild(issue);

                Element message = doc.createElement("message");
                message.setTextContent(s);
                issue.appendChild(message);
            }
        }

        return result;
    }


    private static int getMessageCount(Node[] messages) {

        if (messages == null || messages.length == 0) return 0;

        int count = 0;
        for (Node message : messages) {
            count += message.getFirstChild().getChildNodes().getLength();
        }
        return count;
    }


    private static Document validateWithSchema(InputStream xml, SchemaValidationErrorHandler handler, Ruleset schemaLocation) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        factory.setValidating(true);
        factory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaLanguage",
                "http://www.w3.org/2001/XMLSchema");

        try {
            factory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaSource",
                    schemaLocation.getFile().getAbsolutePath());
        } catch (IOException e) {
            log.error("Could not get schema file path", e);
        }
        factory.setIgnoringElementContentWhitespace(true);
        DocumentBuilder builder;
        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException pce) {
            log.error("Error creating document builder", pce);
            return null;
        }

        builder.setErrorHandler(handler);
        Document doc = null;
        try {
            doc = builder.parse(xml);
        } catch (SAXException e) {
            log.error("Message is not valid XML.");
            handler.addError("Message is not valid XML.", null);
            log.debug("SAXException while parsing", e);
        } catch (IOException e) {
            log.error("Message is not valid XML.  Possible empty message.");
            handler.addError("Message is not valid XML.  Possible empty message.", null);
            log.debug("IOException while parsing", e);
        }
        return doc;
    }

    // validateWithSchematron( ... ) does schematron validation, but not in the
    // most efficient way.  For stable schematron, it would be more efficient
    // to run the schematron through the skeleton transform once, save that
    // transformation to a file and then simply reuse that transform rather than
    // generating it on every run.  That is left as an exercise for the
    // implementor.

    private static String validateWithSchematron(Document xml, Ruleset schematronLocation, Ruleset skeletonLocation, String phase) {

        StringBuilder result = new StringBuilder();
        try {
            File schematron = schematronLocation.getFile();
            File skeleton = skeletonLocation.getFile();
            Node schematronTransform = Validator.doTransform(schematron, skeleton, phase);
            result.append(Validator.doTransform(xml, schematronTransform));
            return result.toString();
        } catch (IOException e) {
            log.error("Error reading schematron/skeleton file", e);
            return null;
        }
    }

    private static Node doTransform(File originalXml, File transform, String phase) {

        System.setProperty("javax.xml.transform.TransformerFactory", "net.sf.saxon.TransformerFactoryImpl");
        DOMResult result = new DOMResult();
        try {
            Source xmlSource = new StreamSource(originalXml);
            Source xsltSource = new StreamSource(transform);

            Transformer transformer = Validator.getTransformerFactory().newTransformer(xsltSource);
            transformer.setParameter("phase", phase);
            transformer.transform(xmlSource, result);
        } catch (TransformerConfigurationException tce) {
            log.error("Transformer configuration error", tce);
            return null;
        } catch (TransformerException te) {
            log.error("Transformation error", te);
            return null;
        } finally {
            System.clearProperty("javax.xml.transform.TransformerFactory");
        }
        return result.getNode();
    }

    private static String doTransform(Document originalXml, Node transform) {

        System.setProperty("javax.xml.transform.TransformerFactory", "net.sf.saxon.TransformerFactoryImpl");
        ByteArrayOutputStream os = new ByteArrayOutputStream();

        StreamResult result = new StreamResult(os);
        try {
            Source xmlSource = new DOMSource(originalXml);
            Source xsltSource = new DOMSource(transform);

            Transformer transformer = Validator.getTransformerFactory().newTransformer(xsltSource);
            transformer.transform(xmlSource, result);
        } catch (TransformerConfigurationException tce) {
            log.error("Transformer configuration error", tce);
            return null;
        } catch (TransformerException te) {
            log.error("Transformation error", te);
            return null;
        } finally {
            System.clearProperty("javax.xml.transform.TransformerFactory");
        }
        return os.toString();
    }


    private static TransformerFactory getTransformerFactory() {
        if (factory == null) {
            factory = TransformerFactory.newInstance();
            final URIResolver oldResolver = factory.getURIResolver();
            factory.setURIResolver((href, base) -> {

                final File cacheLocation = FileCache.getInstance().getDestFile();
                String[] paths = {
                        href,
                        "hitspValidation/schematron/" + href,
                        "hitspValidation/schematron/nhin/summaryPatientRecord" + href
                };
                for (String path : paths) {
                    final File targetFile = new File(cacheLocation, path);
                    if (targetFile.exists()) {
                        log.debug("Using file resource - {} as {}", href, path);
                        return new StreamSource(targetFile);
                    }
                }

                InputStream resourceAsStream = Validator.class.getClassLoader().getResourceAsStream(href);
                if (resourceAsStream != null) {
                    log.debug("Using classpath resource - {}", href);
                    return new StreamSource(resourceAsStream);
                }

                log.debug("Using fallback resource - {}", href);
                return oldResolver.resolve(href, base);
            });
        }
        return factory;
    }

    private static Document stringToDom(String xmlSource) throws SAXException, ParserConfigurationException, IOException {

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setIgnoringElementContentWhitespace(true);
        DocumentBuilder builder = factory.newDocumentBuilder();
        return builder.parse(new InputSource(new StringReader(xmlSource)));
    }

    private static Options setCliOptions() throws IllegalArgumentException {
        Option help = new Option("help", "display this message");

        Option input = Option.builder(INPUT_OPTION)
                .argName(INPUT_OPTION)
                .hasArg()
                .desc("input filename")
                .get();
        Option output = Option.builder(OUTPUT_OPTION)
                .argName(OUTPUT_OPTION)
                .hasArg()
                .desc("output filename (without this option, the default filename is validationResult[timestamp].xml)")
                .get();

        Options cliOptions = new Options();

        cliOptions.addOption(help);
        cliOptions.addOption(input);
        cliOptions.addOption(output);

        return cliOptions;
    }

    private static String createDateOfTest() {
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();
        return dateFormat.format(date);
    }

    private static String createTimeOfTest() {
        DateFormat dateFormat = new SimpleDateFormat("HHmmss.SSSS ZZZZ");
        Date date = new Date();
        return dateFormat.format(date);
    }


    // TODO: For testing/debugging purposes only!
    private static String xmlToString(Node inputNode) {
        try {
            Source source = new DOMSource(inputNode);
            StringWriter stringWriter = new StringWriter();
            Result result = new StreamResult(stringWriter);
            Transformer transformer = Validator.getTransformerFactory().newTransformer();
            transformer.transform(source, result);
            return stringWriter.getBuffer().toString();
        } catch (Exception e) {
            log.error("Error converting XML to string", e);
        }
        return null;
    }

}
