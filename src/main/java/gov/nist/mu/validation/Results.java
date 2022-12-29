package gov.nist.mu.validation;

import lombok.Data;
import lombok.Setter;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Represents results of running a validator.
 *
 * @author rahul somasunderam
 */
@XmlRootElement(name = "Results", namespace = "urn:gov:nist:cdaGuideValidator")
public class Results {
    @Setter
    private List<ValidationResult> validationResults = new ArrayList<>();

    /**
     * Returns the validation results.
     *
     * @return the validation results
     */
    @XmlElement(name = "validationResult")
    public List<ValidationResult> getValidationResults() {
        return validationResults;
    }

    /**
     * Represents a single validation result.
     */
    @Data
    public static class ValidationResult {
        private Issue issue;
    }

    /**
     * Represents an issue that was found during validation.
     */
    @Data
    public static class Issue {
        private String message;
        private String context;
        private String test;
        private String severity;
        private String specification;

        /**
         * Returns the severity of the issue.
         *
         * @return the severity
         */
        @XmlAttribute
        public String getSeverity() {
            return severity;
        }
    }

    /**
     * Returns a list of issues for a given list of severity levels.
     *
     * @param severities list of severity levels
     * @return list of issues
     */
    private List<Issue> getIssues(List<String> severities) {
        return this.getValidationResults().stream()
                .map(ValidationResult::getIssue)
                .filter(issue -> severities == null || severities.contains(issue.getSeverity()))
                .collect(Collectors.toList());
    }

    /**
     * Get all issues.
     *
     * @return list of issues
     */
    public List<Issue> getAllIssues() {
        return getIssues(null);
    }

    private static final List<String> allPhases = Arrays.asList(
            "error", "errors", "warning", "warnings", "note", "notes", "violation", "manual");

    /**
     * Get issues for unknown phases.
     *
     * @return list of issues
     */
    public List<Issue> getOtherIssues() {

        return this.getValidationResults().stream()
                .map(ValidationResult::getIssue)
                .filter(issue -> !allPhases.contains(issue.getSeverity()))
                .collect(Collectors.toList());
    }

    /**
     * Gets issues for severity level error.
     *
     * @return list of issues
     */
    public List<Issue> getErrors() {
        return getIssues(Arrays.asList("error", "errors"));
    }

    /**
     * Gets issues for severity level warning.
     *
     * @return list of issues
     */
    public List<Issue> getWarnings() {
        return getIssues(Arrays.asList("warning", "warnings"));
    }

    /**
     * Gets issues for severity level note.
     *
     * @return list of issues
     */
    public List<Issue> getNotes() {
        return getIssues(Arrays.asList("note", "notes"));
    }

    /**
     * Gets issues for severity level violation.
     *
     * @return list of issues
     */
    public List<Issue> getViolations() {
        return getIssues(Collections.singletonList("violation"));
    }

    /**
     * Gets issues for severity level manual.
     *
     * @return list of issues
     */
    public List<Issue> getManualChecks() {
        return getIssues(Collections.singletonList("manual"));
    }

}
