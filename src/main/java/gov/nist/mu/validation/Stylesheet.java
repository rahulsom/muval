package gov.nist.mu.validation;

/**
 * Represents a stylesheet.
 *
 * @author rahul somasunderam
 */
public class Stylesheet extends Ruleset {
    /**
     * Creates a new Stylesheet.
     *
     * @param resourceName name of the resource
     * @param filename     name of the file
     */
    public Stylesheet(String resourceName, String filename) {
        super(resourceName, filename);
    }
}
