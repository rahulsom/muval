README.txt

Meaningful Use HITSP/C32 v2.5 Validation Tools
http://healthcare.nist.gov/

Release Date: 10/13/2010

This package contains the HITSP/C32 validation tools used for validating the XML documents against the structure defined by the HITSP/C32 HITSP Summary Documents Using HL7 Continuity of Care Document (CCD) Component v2.5 and all included and referenced standards/specifications/guidelines.


Package Contents:

schema/ -- A directory containing the HL7 CDA R2 schema and related files.  This schema has been modified to include additions to the CDA R2 model as defined by HITSP.  See Chapter 4.1 of HITSP/C83 v2.0.

schematron/ -- A directory containing the schematron rules and related files for validating HL7.  The schematron includes rules for HL7 CCD, HITSP specifications, HL7 CDA for Common Document Types For CDA (CDA4CDT) and IHE Patient Care Coordination (PCC).

Validator.jar -- A bare-bones, simplistic, no frills command-line tool demonstrating how to use the schema and schematron rules.

lib/ -- A directory containing library .jar files needed by Validator.jar.

src/ -- A directory containing the source code for Validator.jar

changelog.txt -- List of changes in this and previous releases.

The CCD schematron files are modified versions of the files available for download at the HL7 Wiki: http://wiki.hl7.org/index.php?title=Continuity_of_Care_Document_%28CCD%29



Command-line tool usage:

usage: java -jar Validator.jar
 -input <filename>     input filename
 -output <filename>    output filename (without this option, the default
                                        filename is validationResult[timestamp].xml)


Example: username@localhost:~/c32files> java -jar Validator.jar -input HITSP_C32.xml -output report.xml

Note that the working directory (the directory that the .jar file is launched from) must be the directory containing the muCcdValidation.jar file (and has the lib, cdar2 and schematron directories as one level down from this).

The output of the report is an XML file containing header information (where the data about the test is displayed, a list of errors/warnings (if any), a list of successes (if any) and the original input.  The XML will be in the following format:

<Report>
	<ReportHeader>
		<ValidationStatus>Complete</ValidationStatus>
		<ServiceName>Meaningful Use HITSP/C32 v2.5 Validation</ServiceName>
		<DateOfTest>20100813</DateOfTest>
		<TimeOfTest>160352.0224 -0400</TimeOfTest>
		<ResultOfTest>Failed</ResultOfTest>
		<ErrorCount>7</ErrorCount>
	</ReportHeader>
	<Results severity="schemaViolation" specification="cda_r2">
		<issue>
			<message>cvc-complex-type.2.4.a: Invalid content was found starting with element 'addr'.
				One of '{"urn:hl7-org:v3":realmCode, "urn:hl7-org:v3":typeId,
				"urn:hl7-org:v3":templateId, "urn:hl7-org:v3":id}' is expected.</message>
		</issue>
	</Results>
	<Results severity="errors" specification="ccd">
		<issue>
			<message>CONF-390: The value for Section / code SHALL be 30954-2 Relevant diagnostic
				tests and/or laboratory data 2.16.840.1.113883.6.1 LOINC STATIC.</message>
			<context>/ClinicalDocument[1]/component[1]/structuredBody[1]/component[4]/section[1]</context>
			<test>cda:code[@code='30954-2'][@codeSystem='2.16.840.1.113883.6.1']</test>
		</issue>
...

(The rest of the XML report removed for brevity.)

Whether the overall test was a success or failure will be reported in the header along with other information such as the number of errors, date/time stamp, etc.  Violations of the CDA R2 schema will display the error message from the XML parser.  Each schematron issue contains a message, the context (an XPath expression showing the location) and the schematron test that was run at that location.

The command-line tool has been tested with Java 1.5.

Depending on the environment, the Java command-line tool may search for voc.xml files in different places.  Please verify that the JVM can find voc.xml file(s) either in the directory of the schematron file which calls them, or in the current working directory of the JVM.


For more information on this project, please visit http://healthcare.nist.gov/index.html

Any questions/comments/problems should be sent to: andrew.mccaffrey@nist.gov and/or hit-tst-fdbk@nist.gov


Disclaimers

Favorable outcome in the use of the test materials on this site does not imply
conformance recognition by NIST or HL7.

Links to non-Federal Government Web sites do not imply NIST endorsement of any
particular product, service, organization, company, information provider, or
content.

This software was developed at the National Institute of Standards and Technology
by employees of the Federal Government in the course of their official duties.
Pursuant to title 17 Section 105 of the United States Code this software is not
subject to copyright protection and is in the public domain.

The CDA Guideline Validator is an experimental system. NIST assumes no responsibility
whatsoever for its use by other parties, and makes no guarantees, expressed or implied,
about its quality, reliability, or any other characteristic. We would appreciate
acknowledgment if the software is used. This software can be redistributed and/or
modified freely provided that any derivative works bear some notice that they are
derived from it, and any modified versions bear some notice that they have been
modified.


