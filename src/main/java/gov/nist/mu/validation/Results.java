package gov.nist.mu.validation;

import org.apache.commons.lang.builder.ToStringBuilder;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Represents results of running a validator
 *
 * @author rahul somasunderam
 */
@XmlRootElement(name = "Results", namespace = "urn:gov:nist:cdaGuideValidator")
public class Results {
    private List<ValidationResult> validationResults = new ArrayList<>();

    @XmlElement(name = "validationResult")
    public List<ValidationResult> getValidationResults() {
        return validationResults;
    }

    public void setValidationResults(List<ValidationResult> validationResults) {
        this.validationResults = validationResults;
    }

    private static class ValidationResult {
        private Issue issue;

        public Issue getIssue() {
            return issue;
        }

        public void setIssue(Issue issue) {
            this.issue = issue;
        }

        @Override
        public String toString() {
            return new ToStringBuilder(this)
                    .append("issue", issue)
                    .toString();
        }
    }

    private static class Issue {
        private String message;
        private String context;
        private String test;
        private String severity;
        private String specification;

        @Override
        public String toString() {
            return new ToStringBuilder(this)
                    .append("message", message)
                    .append("context", context)
                    .append("test", test)
                    .append("severity", severity)
                    .append("specification", specification)
                    .toString();
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public String getContext() {
            return context;
        }

        public void setContext(String context) {
            this.context = context;
        }

        public String getTest() {
            return test;
        }

        public void setTest(String test) {
            this.test = test;
        }

        @XmlAttribute
        public String getSeverity() {
            return severity;
        }

        public void setSeverity(String severity) {
            this.severity = severity;
        }

        public String getSpecification() {
            return specification;
        }

        public void setSpecification(String specification) {
            this.specification = specification;
        }

    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("validationResults", validationResults)
                .toString();
    }

    private List<Issue> getIssues(List<String> severities) {
        return this.getValidationResults().stream()
                .map(ValidationResult::getIssue)
                .filter(issue -> severities == null || severities.contains(issue.getSeverity()))
                .collect(Collectors.toList());
    }

    public List<Issue> getAllIssues() {
        return getIssues(null);
    }

    private static final List<String> allPhases = Arrays.asList(
            "error", "errors", "warning", "warnings", "note", "notes", "violation", "manual");

    public List<Issue> getOtherIssues() {

        return this.getValidationResults().stream()
                .map(ValidationResult::getIssue)
                .filter(issue -> !allPhases.contains(issue.getSeverity()))
                .collect(Collectors.toList());
    }

    public List<Issue> getErrors() {
        return getIssues(Arrays.asList("error", "errors"));
    }

    public List<Issue> getWarnings() {
        return getIssues(Arrays.asList("warning", "warnings"));
    }

    public List<Issue> getNotes() {
        return getIssues(Arrays.asList("note", "notes"));
    }

    public List<Issue> getViolations() {
        return getIssues(Collections.singletonList("violation"));
    }

    public List<Issue> getManualChecks() {
        return getIssues(Collections.singletonList("manual"));
    }


}
