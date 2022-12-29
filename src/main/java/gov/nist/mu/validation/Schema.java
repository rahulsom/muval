package gov.nist.mu.validation;

/**
 * Represents a Schema.
 *
 * @author rahul somasunderam
 */
public class Schema extends Ruleset {
    /**
     * Creates a new Schema.
     *
     * @param resourceName name of the resource
     * @param filename     name of the file
     */
    public Schema(String resourceName, String filename) {
        super(resourceName, filename);
    }
}
