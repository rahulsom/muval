Title: HL7 QRDA Category I & BMI Schematron Rules

Description: This package contains the schematron rules for validating XML documents
against the guidelines specified by HL7's Implementation Guide for CDA Release 2
Quality Reporting Document Architecture (QRDA).  The rules contained within this package 
validate against only the rules specified by Category I and the Body Mass Index (BMI).  
Running XML documents through these schematron files will not check them against any 
Clinical Document Architecture Release 2 (CDA R2) requirements.

Release Date: April 29, 2010


Package Contents:

qrdaCat1.sch -- Schematron file for HL7 QRDA Category I

bmi.sch -- Schematron file for HL7 QRDA Body Mass Index (BMI).

templates -- Directory containing all entity files which are imported by the main .sch
schematron files.
