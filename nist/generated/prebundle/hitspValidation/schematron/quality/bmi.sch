<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE schema [

<!ENTITY ent-qrda_bmi SYSTEM 'templates/qrda_bmi.ent'>
<!ENTITY ent-2.16.840.1.113883.10.20.12 SYSTEM 'templates/2.16.840.1.113883.10.20.12.ent'>

]>


<!--
    

-->
<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <title>Schematron schema for validating Body Mass Index</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <phase id="errors">
        <active pattern="p-qrda_bmi-errors"/>
        <active pattern="p-2.16.840.1.113883.10.20.12-errors"/>

    </phase>

    <phase id="warning">
        <active pattern="p-qrda_bmi-warnings"/>
        <active pattern="p-2.16.840.1.113883.10.20.12-warnings"/>

    </phase>

    <phase id="notes">
        <active pattern="p-qrda_bmi-notes"/>
        <active pattern="p-2.16.840.1.113883.10.20.12-notes"/>

    </phase> 
    
    &ent-qrda_bmi;
    &ent-2.16.840.1.113883.10.20.12;

</schema>
