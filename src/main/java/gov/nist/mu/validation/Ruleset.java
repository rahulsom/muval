package gov.nist.mu.validation;

import lombok.Data;

import java.io.File;
import java.io.IOException;

/**
 * Represents a Ruleset that can be used to perform validation
 *
 * @author rahul somasunderam
 *
 */
@SuppressWarnings("WeakerAccess")
@Data
public class Ruleset {
    private final String resource;
    private final String fileName;

    /**
     * Returns the file that contains the ruleset.
     *
     * @return the file
     * @throws IOException if the file cannot be created
     */
    public synchronized File getFile() throws IOException {
        return new File(new File(FileCache.getInstance().getDestFile(), resource), fileName);
    }
}
