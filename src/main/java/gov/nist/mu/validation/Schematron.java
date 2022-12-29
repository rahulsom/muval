package gov.nist.mu.validation;

/**
 * Represents a schematron rule.
 *
 * @author rahul somasunderam
 */
public class Schematron extends Ruleset {
    /**
     * Creates a new Schematron.
     *
     * @param resourceName name of the resource
     * @param filename     name of the file
     */
    public Schematron(String resourceName, String filename) {
        super(resourceName, filename);
    }
}
