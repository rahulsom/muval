<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE schema [
<!-- Replace baseURI below with a reference to the published Implementation Guide HTML. -->
<!ENTITY baseURI "">
<!ENTITY ent-1.3.6.1.4.1.19376.1.3.1 SYSTEM 'HITSP_C37_templates/1.3.6.1.4.1.19376.1.3.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.3.3 SYSTEM 'HITSP_C37_templates/1.3.6.1.4.1.19376.1.3.3.ent'>
]>
<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3">
    <!-- 
        To use iso schematron instead of schematron 1.5, 
        change the xmlns attribute from
        "http://www.ascc.net/xml/schematron" 
        to 
        "http://purl.oclc.org/dsdl/schematron"
    -->
    
    <title>HITSP_C37</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="lab" uri="urn:oid:1.3.6.1.4.1.19376.1.3.2"/> 

    
    <phase id='errors'>
        <active pattern='p1.3.6.1.4.1.19376.1.3.3-errors'/>
        <active pattern='p1.3.6.1.4.1.19376.1.3.3-Lev2-errors'/>
        <active pattern='p1.3.6.1.4.1.19376.1.3.1-errors'/>
    </phase>
    
    <phase id='warning'>
        <active pattern='p1.3.6.1.4.1.19376.1.3.3-warning'/>
        <active pattern='p1.3.6.1.4.1.19376.1.3.1-warning'/>
    </phase>
    
    
    <phase id='note'>
        <active pattern='p1.3.6.1.4.1.19376.1.3.3-note'/>
        <active pattern='p1.3.6.1.4.1.19376.1.3.1-note'/>
    </phase>
    
    
    &ent-1.3.6.1.4.1.19376.1.3.3;
    &ent-1.3.6.1.4.1.19376.1.3.1;
  
    
</schema>
