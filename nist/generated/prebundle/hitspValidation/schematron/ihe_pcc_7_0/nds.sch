<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE schema [

<!-- Newborn Discharge Summary (NDS) Specification -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.1.ent'>

<!-- Pregnancy History -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.13.5 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.13.5.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.13 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.13.ent'>

<!-- Coded Social History -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.16.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.16.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.13.4 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.13.4.ent'>

<!-- Labor and Delivery -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.6 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.6.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.3 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.5.3.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.1.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.6 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.6.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.1.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.19 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.19.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.4.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.4.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.4 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.4.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.9 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.21.2.9.ent'>

<!-- Coded Family Medical History -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.15 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.15.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.15 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.15.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.15.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.15.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.13.3 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.13.3.ent'>

<!-- Newborn Delivery Information -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.15 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.15.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.24 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.24.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2.ent'>
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
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10.ent'>

<!-- Admission Physical Exam -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1.2.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1.2.1.ent'>

<!-- Coded Results -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.28 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.28.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.4 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.4.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.13 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.13.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.19 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.19.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.4.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.4.1.ent'>

<!-- Care Plan -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.31 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.31.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.33 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.33.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.7 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.7.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.7.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.7.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.7.2 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.7.2.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.4.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.4.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.12 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.12.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.7.3 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.7.3.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.3.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.3.1.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.19 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.19.ent'>
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.4.14 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.4.14.ent'>

<!-- Hospital Discharge Physical Exam -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.26 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.26.ent'>

<!-- Discharge Diagnosis -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.7 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.7.ent'>

<!-- Discharge Diet -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.33 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.33.ent'>

<!-- Intake and Output -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.1.20.2.3 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.1.20.2.3.ent'>

<!-- Medications Administered -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.21 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.21.ent'>

<!-- Immunizations -->
<!-- Already included above -->

<!-- Problems -->
<!-- Already included above -->

<!-- Reason for Referral -->
<!ENTITY ent-1.3.6.1.4.1.19376.1.5.3.1.3.1 SYSTEM 'templates/1.3.6.1.4.1.19376.1.5.3.1.3.1.ent'>


]>


<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <title>Schematron schema for validating Newborn Discharge Summary (NDS) Specification Module</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <phase id="errors">
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13.5-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.16.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13.4-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.6-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.3-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.6-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.9-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.15-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.15-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.15.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13.3-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.15-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.24-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2-errors"/>
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
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1.2.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.28-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.31-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.33-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7.2-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.12-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7.3-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.3.1-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.14-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.26-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.7-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.33-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.20.2.3-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.21-errors"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.1-errors"/>


    </phase>

    <phase id="warning">
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13.5-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.16.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13.4-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.6-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.5.3-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.6-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.1.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.9-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.15-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.15-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.15.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13.3-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.15-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.24-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2-warnings"/>
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
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1.2.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.28-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.13-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-warning"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4.1-warning"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.31-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.33-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7.2-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.4.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.12-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.7.3-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.3.1-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.19-warning"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.4.14-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.26-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.7-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.33-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.1.20.2.3-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.21-warnings"/>
        <active pattern="p-1.3.6.1.4.1.19376.1.5.3.1.3.1-warnings"/>



    </phase>

    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.13.5;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.13;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.16.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.13.4;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.3;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.6;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.5.3;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.6;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.1.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.19;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.4.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.4;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.9;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.15;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.15;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.15.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.13.3;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.15;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.24;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2;
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
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.21.2.10;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.22.1.1.2.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.28;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.4;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.13;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.19;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.4.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.31;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.33;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.7;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.7.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.7.2;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.4.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.12;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.7.3;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.3.1;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.19;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.4.14;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.26;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.7;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.33;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.1.20.2.3;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.21;
    &ent-1.3.6.1.4.1.19376.1.5.3.1.3.1;

</schema>
