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
@SuppressWarnings("WeakerAccess")
public class Ruleset {
    private final String resource;
    private final String fileName;

    public Ruleset(String resourceName, String filename) {
        this.resource = resourceName;
        this.fileName = filename;
    }

    public synchronized File getFile() throws IOException {
        return new File(new File(FileCache.getInstance().getDestFile(), resource), fileName);
    }
}
