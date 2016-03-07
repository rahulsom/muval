package gov.nist.mu.validation;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Created by rahul on 3/6/16.
 */
@XmlRootElement(name = "Results")
public class Results {
    private String severity;
    private String specification;

    private List<Issue> issues;

    static class Issue {
        private String message;
        private String context;
        private String test;


        @Override
        public String toString() {
            return "\n    Issue{" +
                    "message='" + message + '\'' +
                    ", context='" + context + '\'' +
                    ", test='" + test + '\'' +
                    '}';
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
    }

    @Override
    public String toString() {
        return "Results{" +
                "severity='" + severity + '\'' +
                ", specification='" + specification + '\'' +
                ", issues=" + issues +
                '}';
    }

    @XmlAttribute
    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    @XmlAttribute
    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    @XmlElement(name = "issue")
    public List<Issue> getIssues() {
        return issues;
    }

    public void setIssues(List<Issue> issues) {
        this.issues = issues;
    }
}
