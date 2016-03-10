package gov.nist.mu.validation;

import java.io.*;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Represents a Ruleset that can be used to perform validation
 *
 * @author rahul somasunderam
 *
 */
public class Ruleset {
    private final String resource;
    private final String fileName;
    private final String type;

    public Ruleset(String resourceName, String filename, String type) {
        this.resource = resourceName;
        this.fileName = filename;
        this.type = type;
    }

    public synchronized File getFile() throws IOException {
        return new File(new File(FileCache.getInstance().getDestFile(), resource), fileName);
    }

    public static Ruleset stylesheet = new Ruleset("stylesheet", "schematron-Validator-report.xsl", "stylesheet");

}
