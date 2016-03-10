<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE schema [

<!-- Early Hearing Care Plan Specification -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.4.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.7.3.1.1.15.4.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.1.ent'>

<!-- Risk Indicators for Hearing Loss -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.7.3.1.1.15.3.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.5.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.7.3.1.1.15.5.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.13 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.13.ent'>

<!-- Active Problems -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.6 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.6.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.3 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.3.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.6 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.6.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.1.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.1.2.ent'>

<!-- Physical Exam -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.15 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.15.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.24 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.24.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.16 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.16.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.17 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.17.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.18 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.18.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.19 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.19.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.20 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.20.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.21 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.21.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.22 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.22.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.23 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.23.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.24 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.24.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.25 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.25.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.26 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.26.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.27 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.27.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.28 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.28.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.29 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.29.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.30 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.30.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.31 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.31.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.32 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.32.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.33 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.33.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.34 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.34.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.35 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.35.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.36 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.36.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.37 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.37.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.48 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.48.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1.ent'>

<!-- Pertinent Review of Systems -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.18 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.18.ent'>

<!-- Plan of Care -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.31 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.31.ent'>

<!-- Procedures and Interventions -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.19 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.19.ent'>

<!-- Hearing Screening Coded Results -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.7.3.1.1.15.3.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.28 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.28.ent'>



]>


<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <title>Schematron schema for validating Early Hearing Care Plan Specification Module</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <phase id="errors">
        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.4.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.1-errors"/>

        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.5.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.6-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.2-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.1-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.3-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.6-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.1-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.2-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5-errors"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.2-errors"/> 
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.15-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.24-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.16-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.17-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.18-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.19-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.20-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.21-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.22-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.23-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.24-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.25-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.26-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.27-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.28-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.29-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.30-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.31-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.32-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.33-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.34-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.35-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.36-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.37-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.48-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.18-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.31-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.28-errors"/>


    </phase>

    <phase id="warning">
        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.4.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.1-warnings"/>

        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.5.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.6-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.3-warnings"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.6-warnings"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1-warnings"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.1-warnings"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.2-warnings"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5-warnings"/>        
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.2-warnings"/> 
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.15-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.24-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.16-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.17-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.18-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.19-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.20-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.21-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.22-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.23-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.24-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.25-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.26-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.27-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.28-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.29-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.30-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.31-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.32-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.33-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.34-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.35-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.36-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.37-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.48-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.18-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.31-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.28-warnings"/>



    </phase>

    &ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.4.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.1;                                                                                                           

    &ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.1;
    &ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.5.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.13;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.6;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.3;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.6;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.15;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.24;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.16;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.17;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.18;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.19;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.20;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.21;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.22;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.23;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.24;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.25;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.26;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.27;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.28;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.29;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.30;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.31;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.32;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.33;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.34;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.35;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.36;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.37;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.48;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.16.2.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.18;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.31;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.19;
    &ent-1.3.6.1.4.1.19376.1.7.3.1.1.15.3.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.28;




</schema>
