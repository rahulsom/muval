package buildscript

import groovy.transform.ToString
import javax.xml.bind.annotation.*

@XmlRootElement(namespace = 'urn:gov:nist:cdaGuidelineValidator')
@XmlAccessorType(XmlAccessType.NONE)
@ToString
class DocumentTypes {
    @XmlElement List<DocumentType> documentType
}

@XmlAccessorType(XmlAccessType.NONE)
@ToString
class DocumentType {
    @XmlAttribute String id
    @XmlElement String displayName
    @XmlElement String description
    @XmlElement Validation validation
    @XmlElement Dependencies dependencies
}

@XmlAccessorType(XmlAccessType.NONE)
@ToString
class Validation {
    @XmlAttribute String type
    @XmlValue String url
}

@XmlAccessorType(XmlAccessType.NONE)
@ToString
class Dependencies {
    @XmlElement List<Dependency> dependency
}

@XmlAccessorType(XmlAccessType.NONE)
@ToString
class Dependency {
    @XmlAttribute Integer sequenceNumber
    @XmlValue String id
}