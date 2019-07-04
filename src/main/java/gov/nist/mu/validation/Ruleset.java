package gov.nist.mu.validation;

import java.io.File;
import java.io.IOException;

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
