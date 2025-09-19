package buildscript;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlValue;
import lombok.Data;

import java.util.List;

@Data
@XmlRootElement(namespace = "urn:gov:nist:cdaGuidelineValidator")
@XmlAccessorType(XmlAccessType.NONE)
class DocumentTypes {
    @XmlElement 
    private List<DocumentType> documentType;

}

@Data
@XmlAccessorType(XmlAccessType.NONE)
class DocumentType {
    @XmlAttribute 
    private String id;
    @XmlElement 
    private String displayName;
    @XmlElement 
    private String description;
    @XmlElement 
    private Validation validation;
    @XmlElement 
    private Dependencies dependencies;

}

@Data
@XmlAccessorType(XmlAccessType.NONE)
class Validation {
    @XmlAttribute 
    private String type;
    @XmlValue 
    private String url;

}

@Data
@XmlAccessorType(XmlAccessType.NONE)
class Dependencies {
    @XmlElement 
    private List<Dependency> dependency;

}

@Data
@XmlAccessorType(XmlAccessType.NONE)
class Dependency {
    @XmlAttribute 
    private Integer sequenceNumber;
    @XmlValue 
    private String id;

}