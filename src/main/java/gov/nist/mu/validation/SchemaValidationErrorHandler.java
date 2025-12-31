/*
 * This software was developed at the National Institute of Standards and Technology
 * by employees of the Federal Government in the course of their official duties.
 * Pursuant to title 17 Section 105 of the United States Code this software is not
 * subject to copyright protection and is in the public domain.
 *
 * The CDA Guideline Validator is an experimental system. NIST assumes no responsibility
 * whatsoever for its use by other parties, and makes no guarantees, expressed or implied,
 * about its quality, reliability, or any other characteristic. We would appreciate
 * acknowledgment if the software is used. This software can be redistributed and/or
 * modified freely provided that any derivative works bear some notice that they are
 * derived from it, and any modified versions bear some notice that they have been
 * modified.
 */
package gov.nist.mu.validation;

import lombok.Data;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author andrew.mccaffrey
 */
@Data
public class SchemaValidationErrorHandler implements ErrorHandler {

    private List<String> warnings = null;
    private List<String> linesWarnings = null;
    private List<String> errors = null;
    private List<String> linesErrors = null;
    private List<String> fatalErrors = null;
    private List<String> linesFatalErrors = null;

    /**
     * Creates a new instance of SchemaValidationErrorHandler
     */
    public SchemaValidationErrorHandler() {
    }

    public void warning(SAXParseException exception) throws SAXException {
        this.addWarning(exception.getMessage(), Integer.toString(exception.getLineNumber()));
    }

    public void fatalError(SAXParseException exception) throws SAXException {
        this.addFatalError(exception.getMessage(), Integer.toString(exception.getLineNumber()));
    }

    public void error(SAXParseException exception) throws SAXException {
        this.addError(exception.getMessage(), Integer.toString(exception.getLineNumber()));
    }

    /**
     * Whether the result has warnings.
     *
     * @return true if warnings exist, false otherwise.
     */
    public boolean hasWarnings() {
        if(getWarnings() == null)
            return false;
        if(getWarnings().isEmpty())
            return false;
        return true;
    }

    /**
     * Whether the result has errors.
     *
     * @return true if errors exist, false otherwise.
     */
    public boolean hasErrors() {
        if(getErrors() == null)
            return false;
        if(getErrors().isEmpty())
            return false;
        return true;
    }

    /**
     * Whether the result has fatal errors.
     *
     * @return true if fatal errors exist, false otherwise.
     */
    public boolean hasFatalErrors() {
        if(getFatalErrors() == null)
            return false;
        if(getFatalErrors().isEmpty())
            return false;
        return true;
    }

    /**
     * Gets a string representation of warnings.
     *
     * @return a string representation of warnings.
     */
    public String getPrintableWarnings() {
        if(getWarnings() == null)
            return "";
        var it = getWarnings().iterator();
        StringBuilder sb = new StringBuilder();
        while(it.hasNext()) {
            sb.append("Warning: " + it.next() + "\n");
        }
        return sb.toString();
    }

    /**
     * Gets a string representation of errors.
     *
     * @return a string representation of errors.
     */
    public String getPrintableErrors() {
        if(getErrors() == null)
            return "";
        var it = getErrors().iterator();
        StringBuilder sb = new StringBuilder();
        while(it.hasNext()) {
            sb.append("Error: " + it.next() + "\n");
        }
        return sb.toString();

    }

    /**
     * Gets a string representation of fatal errors.
     *
     * @return a string representation of fatal errors.
     */
    public String getPrintableFatalErrors() {
        if(getFatalErrors() == null)
            return "";
        var it = getFatalErrors().iterator();
        StringBuilder sb = new StringBuilder();
        while(it.hasNext()) {
            sb.append("Fatal Error: " + it.next() + "\n");
        }
        return sb.toString();
    }

    /**
     * Adds a warning.
     *
     * @param warning message
     * @param lineNumber the line with the warning
     * @return true if the warning was added, false otherwise.
     */
    public boolean addWarning(String warning, String lineNumber) {
        if(getWarnings() == null) {
            setWarnings(new ArrayList<>());
            setLinesWarnings(new ArrayList<>());
        }
        return (getWarnings().add(warning) && getLinesWarnings().add(lineNumber));
    }

    /**
     * Adds an error.
     *
     * @param error message
     * @param lineNumber the line with the error
     * @return true if the error was added, false otherwise.
     */
    public boolean addError(String error, String lineNumber) {
        if(getErrors() == null) {
            setErrors(new ArrayList<>());
            setLinesErrors(new ArrayList<>());
        }
        return (getErrors().add(error) && getLinesErrors().add(lineNumber));
    }

    /**
     * Adds a fatal error.
     *
     * @param fatalError message
     * @param lineNumber the line with the fatal error
     * @return true if the fatal error was added, false otherwise.
     */
    public boolean addFatalError(String fatalError, String lineNumber) {
        if(getFatalErrors() == null) {
            setFatalErrors(new ArrayList<>());
            setLinesErrors(new ArrayList<>());
        }
        return (getFatalErrors().add(fatalError) && getLinesErrors().add(lineNumber));
    }

    /**
     * Gets the number of errors.
     *
     * @return the number of errors
     */
    public int getNumberErrors() {
        try {
            return linesErrors.size();
        } catch(Exception e) {
            return 0;
        }
    }

    /**
     * Gets the number of warnings.
     *
     * @return the number of warnings
     */
    public int getNumberWarnings() {
        try {
            return linesWarnings.size();
        } catch(Exception e) {
            return 0;
        }
    }

    /**
     * Gets the number of fatal errors.
     *
     * @return the number of fatal errors
     */
    public int getNumberFatalErrors() {
        try {
            return linesFatalErrors.size();
        } catch(Exception e) {
            return 0;
        }
    }
}
