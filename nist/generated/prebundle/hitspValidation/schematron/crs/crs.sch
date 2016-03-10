<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE schema [

<!-- 

This schematron file has been modified for use as specified in the IHE PCC
Medical Documents Specification
<http://wiki.ihe.net/index.php?title=1.3.6.1.4.1.19376.1.5.3.1.1.1>.

There are two main modifications.  The first is to restrict this to Level 1
constraints only.  The second is to remove contraints on the type of document.

-->

<!-- 
Replace baseURI below with a reference to the published Implementation Guide HTML.
-->
<!ENTITY baseURI "">
]>
<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3">
    <title>Schematron schema for validating conformance to IMPL_CDAR2_LEVEL1-2REF_US_I3_2006JAN</title>
    <ns prefix="cda" uri="urn:hl7-org:v3" />
    <ns prefix="crs" uri="urn:hl7-org:crs" />
    
    <phase id='errors'>
        <active pattern='ClinicalDocument'/>
        <active pattern='ClinicalDocument_General_Constraints'/>
        <active pattern='ClinicalDocument_typeId'/>
        <active pattern='ClinicalDocument_templateId'/>
        <active pattern='ClinicalDocument_id'/>
<!--
        <active pattern='ClinicalDocument_code'/>
-->
        <active pattern='ClinicalDocument_setId'/>
        <active pattern='ClinicalDocument_copyTime'/>
        <active pattern='recordTarget'/>
        <active pattern='author'/>
        <active pattern='dataEnterer'/>
        <active pattern='informant'/>
        <active pattern='informant-2'/>
        <active pattern='informationRecipient'/>
        <active pattern='legalAuthenticator'/>
        <active pattern='authenticator'/>
        <active pattern='participant'/>
        <active pattern='ClinicalDocument_copyTime'/>
        <active pattern='documentationOf'/>
        <active pattern='componentOf'/>
<!--
        <active pattern='Body'/>
-->
    </phase>
    <phase id='warning'>
        <active pattern='ClinicalDocument_General_Constraints_Warnings'/>
        <active pattern='recordTarget_warnings'/>
        <active pattern='informant_warnings'/>
        <active pattern='documentationOf_warnings'/>
        <active pattern='nonXMLBody_warnings'/>
    </phase>
<!--
    <phase id='manual'>
        <active pattern='Body_manual'/>
        <active pattern='ClinicalDocument_code_manual'/>
    </phase>
-->
    
    <pattern id='ClinicalDocument' name='ClinicalDocument' see='&baseURI;#ClinicalDocument'>
        <p>This schema applies to CDA Release 2.0 documents.</p>
        <rule id='cda-root' context='/*'>
            <assert test='self::cda:ClinicalDocument'>
                Error: The root of a Care Record Summary must be a ClinicalDocument element from 
                the urn:hl7-org-v3 namespace.
            </assert>
        </rule>
    </pattern>
    
    <pattern id='ClinicalDocument_General_Constraints_Warnings' name='ClinicalDocument_General_Constraints_Warnings'
        see='&baseURI;#ClinicalDocument_General_Constraints'>
        <rule id='assigned-person-warnings' 
            context='cda:guardian|cda:dataEnterer/cda:assignedEntity|cda:relatedEntity|cda:intendedRecipient|
            cda:relatedSubject|cda:participantRole'>
            <assert diagnostics="L1-3" test='cda:addr'>
            Warning: All guardian,
	    dataEnterer/assignedEntity,
	    relatedEntity,
            intendedRecipient, relatedSubject and
	    participantRole elements
            should have an addr and telecom
	    element.
            </assert>
            <assert diagnostics="L1-3" test='cda:telecom'>
            Warning: All guardian,
            dataEnterer/assignedEntity,
            relatedEntity,
            intendedRecipient, relatedSubject and
            participantRole elements
            should have an addr and telecom
            element.
            </assert>
        </rule>
        <rule id='general-time-req-warnings' 
            context='cda:authenticator/cda:time | 
            cda:author/cda:time | 
            cda:dataEnterer/cda:time | 
            cda:legalAuthenticator/cda:time | 
            cda:ClinicalDocument/cda:effectiveTime | 
            cda:encompassingEncounter/cda:effectiveTime | 
            cda:encompassingEncounter/cda:effectiveTime/cda:low |
            cda:encompassingEncounter/cda:effectiveTime/cda:center |
            cda:encompassingEncounter/cda:effectiveTime/cda:high'>
            <assert diagnostics='L1-5' test='not(@value) or string-length(@value) &gt; 18'>
            Times or time intervals found in the
	    ClinicalDocument/effectiveTime,
            author/time, dataEnterer/time,
	    legalAuthenticator/time,
            authenticator/time and
	    encompassingEncounter/effectiveTime elements shall be
            precise to the day, shall include a time zone if more precise than
	    to the day, and should be precise to
            the second.
            </assert>
        </rule>
        <rule id='general-time-req-2-warnings' 
            context='cda:patient/cda:birthTime | 
            
            cda:ClinicalDocument/cda:participant/cda:time | 
            cda:encompassingEncounter/cda:effectiveTime |
            cda:asOrganizationPartOf/cda:effectiveTime | 
            cda:asMaintainedEntity/cda:effectiveTime | 
            cda:relatedEntity/cda:effectiveTime | 
            cda:serviceEvent/cda:effectiveTime |
            
            cda:ClinicalDocument/cda:participant/cda:time/cda:low | 
            cda:encompassingEncounter/cda:effectiveTime/cda:low |
            cda:asOrganizationPartOf/cda:effectiveTime/cda:low | 
            cda:asMaintainedEntity/cda:effectiveTime/cda:low | 
            cda:relatedEntity/cda:effectiveTime/cda:low | 
            cda:serviceEvent/cda:effectiveTime/cda:low | 
            
            cda:ClinicalDocument/cda:participant/cda:time/cda:center | 
            cda:encompassingEncounter/cda:effectiveTime/cda:center |
            cda:asOrganizationPartOf/cda:effectiveTime/cda:center | 
            cda:asMaintainedEntity/cda:effectiveTime/cda:center | 
            cda:relatedEntity/cda:effectiveTime/cda:center | 
            cda:serviceEvent/cda:effectiveTime/cda:center | 
            
            cda:ClinicalDocument/cda:participant/cda:time/cda:high | 
            cda:encompassingEncounter/cda:effectiveTime/cda:high |
            cda:asOrganizationPartOf/cda:effectiveTime/cda:high | 
            cda:asMaintainedEntity/cda:effectiveTime/cda:high | 
            cda:relatedEntity/cda:effectiveTime/cda:high | 
            cda:serviceEvent/cda:effectiveTime/cda:high
            
            '>
            <assert diagnostics='L1-7' test='not(@value) or string-length(@value) &gt; 7'>
            Times or time intervals found in the
	    patient/birthTime,
            asOrganizationPartOf/effectiveTime,
	    asMaintainedEntity/effectiveTime,
            relatedEntity/effectiveTime,
            serviceEvent/effectiveTime,
	    ClinicalDocument/participant/time,
            serviceEvent/performer/time and
	    encounterParticipant/time shall be precise at
            least to the year, should be precise to the day, and may omit time
	    zone.
            </assert>
        </rule>
    </pattern>
    
    <pattern name='ClinicalDocument_General_Constraints'  id='ClinicalDocument_General_Constraints' see='&baseURI;#ClinicalDocument_General_Constraints'>
        <rule id='general-addr-null' context='cda:addr[@nullFlavor != ""]'>
            <assert id='null-or-no-content' test='normalize-space(.) = ""'>
                Error: When the addr element is null, it must not have content.
            </assert>
        </rule>
        <rule id='general-addr-not-null' context='cda:addr[@nullFlavor = ""]'>
            <assert id='empty-implies-null' test='string-length(normalize-space(.)) &gt; 0'>
                Error: When the addr element is empty, it must have a value for 
                nullFlavor.
            </assert>
        </rule>
        <rule id='general-person' 
            context='cda:patient|cda:guardianPerson|cda:assignedPerson|cda:maintainingPerson|
            cda:relatedPerson|cda:intendedRecipient/cda:informationRecipient|cda:associatedPerson|
            cda:relatedSubject/cda:subject'>
            <assert diagnostics="L1-1" test='cda:name'>
            Error: All patient, guardianPerson,
	    assignedPerson,
            maintainingPerson, relatedPerson,
            intendedRecipient/informationRecipient,
	    associatedPerson, and
            relatedSubject/subject elements shall have a
	    name.
	    </assert>
        </rule>
        <rule id='assigned-person' 
            context='cda:patientRole|cda:assignedAuthor|cda:assignedEntity|cda:associatedEntity'>
            <assert diagnostics="L1-2" test='cda:addr or ../self::cda:dataEnterer'>
            Error: All patientRole, assignedAuthor,
            assignedEntity[not(parent::dataEnterer)] and
	    associatedEntity elements shall
            have an addr and telecom
	    element.

            </assert>
            <assert diagnostics="L1-2" test='cda:telecom or ../self::cda:dataEnterer'>
            Error: All patientRole, assignedAuthor,
            assignedEntity[not(parent::dataEnterer)] and
            associatedEntity elements shall
            have an addr and telecom
            element.
            </assert>
        </rule>
        <rule id='general-org' 
            context='cda:guardianOrganization|cda:providerOrganization|cda:wholeOrganization|
            cda:representedOrganization|cda:recievedOrganization|cda:scopingOrganization|
            cda:serviceProviderOrganization'>
            <assert diagnostics='L1-4' test='cda:name'>
            Error: All guardianOrganization,
            providerOrganization,
            wholeOrganization,
            representedOrganization,
            representedCustodianOrganization,
            recievedOrganization,
            scopingOrganization and 
serviceProviderOrganization elements shall have name,
            addr and telecom elements.
            </assert>
            <assert diagnostics='L1-4' test='cda:addr'>
            Error: All guardianOrganization,
            providerOrganization,
            wholeOrganization,
            representedOrganization,
            representedCustodianOrganization,
            recievedOrganization,
            scopingOrganization and 
serviceProviderOrganization elements shall have name,
            addr and telecom elements.
            </assert>
            <assert diagnostics='L1-4' test='cda:telecom'>
            Error: All guardianOrganization,
            providerOrganization,
            wholeOrganization,
            representedOrganization,
            representedCustodianOrganization,
            recievedOrganization,
            scopingOrganization and 
serviceProviderOrganization elements shall have name,
            addr and telecom elements.
            </assert>
        </rule>
        
        <rule id='general-time-req' 
            context='cda:authenticator/cda:time | 
            cda:author/cda:time | 
            cda:dataEnterer/cda:time | 
            cda:legalAuthenticator/cda:time | 
            cda:ClinicalDocument/cda:effectiveTime | 
            cda:encompassingEncounter/cda:effectiveTime | 
            cda:encompassingEncounter/cda:effectiveTime/cda:low |
            cda:encompassingEncounter/cda:effectiveTime/cda:center |
            cda:encompassingEncounter/cda:effectiveTime/cda:high'>
            <assert diagnostics='L1-5' test='not(@value) or string-length(@value) &gt; 7'>
            Error: Times or time intervals found in the
            ClinicalDocument/effectiveTime,
            author/time, dataEnterer/time,
            legalAuthenticator/time,
            authenticator/time and
            encompassingEncounter/effectiveTime elements shall be
            precise to the day, shall include a time zone if more precise than
            to the day, and should be precise to
            the second.
            </assert>
            <assert diagnostics='L1-5' 
                test='not(@value) or 
                (not(contains(translate(@value,"+-","ZZ"),"Z")) and string-length(@value) &gt; 7) or 
                string-length(substring-before(translate(@value,"+-","ZZ"),"Z")) &gt; 7'
                >
            Error: Times or time intervals found in the
            ClinicalDocument/effectiveTime,
            author/time, dataEnterer/time,
            legalAuthenticator/time,
            authenticator/time and
            encompassingEncounter/effectiveTime elements shall be
            precise to the day, shall include a time zone if more precise than
            to the day, and should be precise to
            the second.

            </assert>
            <assert diagnostics='L1-5' 
                test='contains(translate(@value,"+-","ZZ"),"Z") or
            string-length(@value) &lt; 9'>
            Error: Times or time intervals found in the
            ClinicalDocument/effectiveTime,
            author/time, dataEnterer/time,
            legalAuthenticator/time,
            authenticator/time and
            encompassingEncounter/effectiveTime elements shall be
            precise to the day, shall include a time zone if more precise than
            to the day, and should be precise to
            the second.
	    </assert>
        </rule>
        
        <rule id='general-time-effectiveTime-IVL_TS' context='cda:encompassingEncounter | cda:serviceEvent'>
            <assert diagnostics='L1-7' 
                test='count(cda:effectiveTime/@value | 
                cda:effectiveTime/cda:low/@value | 
                cda:effectiveTime/cda:high/@value | 
                cda:effectiveTime/cda:center/@value) &gt; 0'
                >
            Error: Times or time intervals found in the
            patient/birthTime,
            asOrganizationPartOf/effectiveTime,
            asMaintainedEntity/effectiveTime,
            relatedEntity/effectiveTime,
            serviceEvent/effectiveTime,
            ClinicalDocument/participant/time,
            serviceEvent/performer/time and
            encounterParticipant/time shall be precise at
            least to the year, should be precise to the day, and may omit time
            zone.
            </assert>
        </rule>
        
        <rule id='general-time-req-2' 
            context='cda:patient/cda:birthTime | 
            
            cda:ClinicalDocument/cda:participant/cda:time | 
            cda:encompassingEncounter/cda:effectiveTime |
            cda:asOrganizationPartOf/cda:effectiveTime | 
            cda:asMaintainedEntity/cda:effectiveTime | 
            cda:relatedEntity/cda:effectiveTime | 
            cda:serviceEvent/cda:effectiveTime |
            
            cda:ClinicalDocument/cda:participant/cda:time/cda:low | 
            cda:encompassingEncounter/cda:effectiveTime/cda:low |
            cda:asOrganizationPartOf/cda:effectiveTime/cda:low | 
            cda:asMaintainedEntity/cda:effectiveTime/cda:low | 
            cda:relatedEntity/cda:effectiveTime/cda:low | 
            cda:serviceEvent/cda:effectiveTime/cda:low | 
            
            cda:ClinicalDocument/cda:participant/cda:time/cda:center | 
            cda:encompassingEncounter/cda:effectiveTime/cda:center |
            cda:asOrganizationPartOf/cda:effectiveTime/cda:center | 
            cda:asMaintainedEntity/cda:effectiveTime/cda:center | 
            cda:relatedEntity/cda:effectiveTime/cda:center | 
            cda:serviceEvent/cda:effectiveTime/cda:center | 
            
            cda:ClinicalDocument/cda:participant/cda:time/cda:high | 
            cda:encompassingEncounter/cda:effectiveTime/cda:high |
            cda:asOrganizationPartOf/cda:effectiveTime/cda:high | 
            cda:asMaintainedEntity/cda:effectiveTime/cda:high | 
            cda:relatedEntity/cda:effectiveTime/cda:high | 
            cda:serviceEvent/cda:effectiveTime/cda:high'
            >
            <assert diagnostics='L1-7' test='not(@value) or string-length(@value) &gt; 4'>
                Error: Times or time intervals found in the
            patient/birthTime,
            asOrganizationPartOf/effectiveTime,
            asMaintainedEntity/effectiveTime,
            relatedEntity/effectiveTime,
            serviceEvent/effectiveTime,
            ClinicalDocument/participant/time,
            serviceEvent/performer/time and
            encounterParticipant/time shall be precise at
            least to the year, should be precise to the day, and may omit time
            zone.

            </assert>
            <assert diagnostics='L1-7' 
                test='not(@value) or contains(translate(@value,"+-","ZZ"),"Z") or string-length(@value) &lt; 9'>
                Error: Times or time intervals found in the
            patient/birthTime,
            asOrganizationPartOf/effectiveTime,
            asMaintainedEntity/effectiveTime,
            relatedEntity/effectiveTime,
            serviceEvent/effectiveTime,
            ClinicalDocument/participant/time,
            serviceEvent/performer/time and
            encounterParticipant/time shall be precise at
            least to the year, should be precise to the day, and may omit time
            zone.

            </assert>
            <assert diagnostics='L1-7' test='not(@value) or string-length(@value) &gt; 7'>
                Warning: Times or time intervals found in the
            patient/birthTime,
            asOrganizationPartOf/effectiveTime,
            asMaintainedEntity/effectiveTime,
            relatedEntity/effectiveTime,
            serviceEvent/effectiveTime,
            ClinicalDocument/participant/time,
            serviceEvent/performer/time and
            encounterParticipant/time shall be precise at
            least to the year, should be precise to the day, and may omit time
            zone.
            </assert>
        </rule>
    </pattern>
    
    <pattern id='Telephone_Numbers' name='Telephone_Numbers' see='&baseURI;#Telephone_Numbers'>
        <rule id='telcom-null-or-valued' context='cda:telecom'>
            <assert test='@value or @nullFlavor'>
                Error: A telecom element must have a value or a flavor of null.
            </assert>
            <assert id='telcom-regex' diagnostics='L1-8' 
                test='not(substring(@value,1,4) = "tel:") or
                string-length(
                concat(translate(substring(@value,5,1),"+0123456789()-.",""),
                translate(substring(@value,6),"0123456789()-.","") )
                ) = 0'>
		Error: Telephone numbers shall match the regular expression patterntel:\+?[-0-9().]+
	    </assert>
            <assert id='telcom-has-digit' diagnostics='L1-9' 
                test='not(substring(@value,1,4) = "tel:") or
                string-length(
                concat(
                translate(substring(@value,5,1),"+()-.",""),
                translate(substring(@value,6),"()-.","")    
                ) ) &gt; 0' >
            Error: At least one dialing digit shall be present in the phone
            number after visual separators are removed.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='ClinicalDocument_typeId' name='ClinicalDocument_typeId' see='&baseURI;#ClinicalDocument_typeId'>
        <rule id='cda-typeid' context="/cda:ClinicalDocument/cda:typeId">
            <assert id='typeId-extension' diagnostics='L1-10' test='@extension = "POCD_HD000040"'/>
        </rule>
    </pattern>
    <pattern id='ClinicalDocument_templateId' name='ClinicalDocument_templateId' see='&baseURI;#ClinicalDocument_templateId'>
        <rule id='cda-templateid' context="/cda:ClinicalDocument">
            <assert id='templateId-extension' diagnostics='L1-11' 
                test='cda:templateId[@extension = "IMPL_CDAR2_LEVEL1" and
                @root="2.16.840.1.113883.10"]'>
            Error: A ClinicalDocument/templateId element shall be
            present where the value of
            @extension is IMPL_CDAR2_LEVEL1 and the
            value of @root is
            2.16.840.1.113883.10.
	    </assert>
        </rule>
    </pattern>
    <pattern id='ClinicalDocument_id' name='ClinicalDocument_id' see='&baseURI;#ClinicalDocument_id'>
        <rule id='cda-id-uuid' context="/cda:ClinicalDocument/cda:id[contains(@root, '-')]">
            <assert diagnostics='L1-12 L1-13' test="string-length(@root) = 37" >
                Error: A properly formatted UUID has only 37 characters.
            </assert>
            <assert diagnostics='L1-12 L1-13' 
                test="translate(substring(@root, 1, 8),'ABCDEFabcdef0123456789','') = ''">
                The first four data bytes of the UUID should be represented using hexidecimal 
                digits ([A-Fa-f0-9]).
            </assert>
            <assert diagnostics='L1-12 L1-13' 
                test="translate(substring(@root, 10, 4),'ABCDEFabcdef0123456789','') = ''" >
                The fifth and sixth data bytes of the UUID should be represented using hexidecimal 
                digits ([A-Fa-f0-9]).
            </assert>
            <assert diagnostics='L1-12 L1-13' 
                test="translate(substring(@root, 15, 4),'ABCDEFabcdef0123456789','') = ''">
                The seventh and eighth data bytes of the UUID should be represented using hexidecimal 
                digits ([A-Fa-f0-9]).
            </assert>
            <assert diagnostics='L1-12 L1-13' 
                test="translate(substring(@root, 20, 4),'ABCDEFabcdef0123456789','') = ''">
                The ninth and tenth data bytes of the UUID should be represented using hexidecimal 
                digits ([A-Fa-f0-9]).
            </assert>
            <assert diagnostics='L1-12 L1-13' 
                test="translate(substring(@root, 25, 12),'ABCDEFabcdef0123456789','') = ''">
                The eleventh through sixteenth data bytes of the UUID should be represented using 
                hexidecimal digits ([A-Fa-f0-9]).
            </assert>
            <assert diagnostics='L1-12 L1-13' test="substring(@root, 9, 1) = '-'">
                A hyphen should separate the first four data bytes from the remainder of the UUID.
            </assert>
            <assert diagnostics='L1-12 L1-13' test="substring(@root, 14, 1) = '-'">
                A hyphen should separate the fifth and sixth data byte from the remainder of the UUID.
            </assert>
            <assert diagnostics='L1-12 L1-13' test="substring(@root, 19, 1) = '-'">
                A hyphen should separate the seventh and eighth data byte from the remainder of the UUID.
            </assert>
            <assert diagnostics='L1-12 L1-13' test="substring(@root, 24, 1) = '-'">
                A hyphen should separate the ninth and tenth data byte from the remainder of the UUID.
            </assert>
        </rule>
        <rule id='cda-id-oid' context="/cda:ClinicalDocument/cda:id[contains(@root, '.')]" >
            <assert test="translate(@root, '0123456789.', '') = ''" diagnostics='L1-14'>
                Error: Characters that are not in the set 0-9 or . are not present in a valid OID.
            </assert>
            <assert diagnostics='L1-12 L1-14' 
                test="not(substring(@root, 1, 1) = '.') and not(substring(@root, string-length(@root), 1) = '.')" >
                Error: The first and last characters of an OID must be a digit.
            </assert>
            <assert diagnostics='L1-12 L1-14' test="not(contains(@root,'..'))">
                A properly formatted OID should not contain two . characters without any 
                intervening digits
            </assert>
            <assert diagnostics='L1-15' test="string-length(@root) &lt; 65"/>
        </rule>
        
        <rule id='cda-id' context='/cda:ClinicalDocument/cda:id[not(contains(@root,".") or contains(@root,"-"))]'>
            <assert diagnostics='L1-12' test='false()' >
	    Error: The ClinicalDocument/id/@root
            attribute shall be a syntactically correct UUID
            or OID.
	    </assert>
        </rule>
    </pattern>
    
<!--
    <pattern id='ClinicalDocument_code' name='ClinicalDocument_code' see='&baseURI;#ClinicalDocument_code'>
        <rule id='clinical-document-code' context='/cda:ClinicalDocument/cda:code'>
            <assert diagnostics='L1-16'
                test='document("voc.xml")/systems/system[@codeSystemName="LOINC"]/code[@value = current()/@code]'>
                Error: The value of /ClinicalDocument/code/@code must come from the 
                appropriate LOINC subset.
            </assert>
            <assert test='@codeSystem = "2.16.840.1.113883.6.1"' diagnostics='L1-16'>
                Error: The value of /ClinicalDocument/code/@codeSystem must be 2.16.840.1.113883.6.1
            </assert>
            <assert test='count(@codeSystemName) = 0 or @codeSystemName="LOINC"' diagnostics='L1-16'>
                Error: The value of /ClinicalDocument/code/@codeSystemName must be 
                LOINC.
            </assert>
        </rule>
    </pattern>
-->
<!--
    <pattern id='ClinicalDocument_code_manual' name='ClinicalDocument_code_manual' see='&baseURI;#ClinicalDocument_code'>
        <rule id='clinical-document-code-role' context='//cda:author/cda:assignedAuthor/cda:code'>
            <assert diagnostics="L1-17" 
                test='/cda:ClinicalDocument/cda:code[@code = "34133-9" or @code = "18842-5" or @code = "18761-7"]' >
                Manual: Verify that the the role code for the author does not conflict with the document type code.
            </assert>
        </rule>
        <rule id='clinical-document-code-function' context='//cda:author/cda:functionCode'>
            <assert diagnostics="L1-18" 
                test='/cda:ClinicalDocument/cda:code[@code = "34133-9" or @code = "18842-5" or @code = "18761-7"]' >
                Manual: Verify that the the function code for author does not conflict with the document type code.
            </assert>
        </rule>
        <rule id='clinical-document-code-service-event' context='//cda:serviceEvent/cda:code'>
            <assert diagnostics="L1-52" 
                test='/cda:ClinicalDocument/cda:code[@code = "34133-9" or @code = "18842-5" or @code = "18761-7"]' >
                Manual: Verify that the code for the serviceEventdoes not conflict with the document type code.
            </assert>   
        </rule>
    </pattern>
-->
    <pattern id='ClinicalDocument_languageCode' name='ClinicalDocument_languageCode' see='&baseURI;#ClinicalDocument_languageCode'>
        <rule id='cda-languageCode' context='/cda:ClinicalDocument'>
            <assert diagnostics='L1-19' test='cda:languageCode'>
                Error: The languageCode element must be present.
            </assert>
        </rule>
        <rule id='cda-languageCode-format' context='/cda:ClinicalDocument/cda:languageCode'>
            <assert diagnostics='L1-20'
                test='(string-length(@code) = 5 and substring(@code,3,1) = "-") or string-length(@code) = 2' >
                Error: The language code must be in the form nn, or nn-CC.
            </assert>
<!--
            <assert diagnostics='L1-21'
                test='substring(@code,1,2) = 
                document("voc.xml")/systems/system[@codeSystemName="ISO639-1"]/code/@value' >
                Error: The language must be a legal ISO-639-1 language code in lower case.
            </assert>
            <assert diagnostics='L1-22'
                test='string-length(@code) = 2 or substring(@code,4,2) = 
                document("voc.xml")/systems/system[@codeSystemName="ISO3166-1"]/code/@value' >
                Error: The country code portion, if present must be an ISO-3166 country code in upper case.
            </assert>
-->
        </rule>
    </pattern>
    
    <pattern id='ClinicalDocument_setId' name='ClinicalDocument_setId' see='&baseURI;#ClinicalDocument_setId'>
        <rule context='/cda:ClinicalDocument'>
            <assert diagnostics="L1-23" test='count(cda:versionNumber) =
            count(cda:setId)'>
	    Error: Both ClinicalDocument/setId and
            ClinicalDocument/versionNumber shall be
            present or absent.
	    </assert>
<!--

Incorrect.  Removing for now.

            <assert diagnostics="L1-24" 
                test='cda:setId/@root != cda:id/@root or cda:setId/@extension != cda:id/@extension'>
            Error: The @extension and/or
            @root of ClinicalDocument/setId and
            ClinicalDocument/id are different when both are present.
	    </assert>
-->
        </rule>
    </pattern>
    
    <pattern id='ClinicalDocument_copyTime' name='ClinicalDocument_copyTime' see='&baseURI;#ClinicalDocument_copyTime'>
        <rule id='cda-copyTime' context='/cda:ClinicalDocument/cda:copyTime'>
            <assert test='false()' diagnostics='L1-25'>
	       Error: A ClinicalDocument/copyTime element shall not be present.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='recordTarget' name='recordTarget' see='&baseURI;#recordTarget'>
        <rule id='cda-recordTarget' context='cda:recordTarget'>
            <assert diagnostics="L1-26" test='count(cda:patientRole) &gt; 0'>
	       Error: At least one recordTarget/patientRole
               element shall be present.
	    </assert>
        </rule>
        <rule id='cda-patient' context='cda:recordTarget/cda:patientRole/cda:patient'>
            <assert diagnostics="L1-27" test='cda:birthTime'>
	       Error: A patient/birthTime element shall be present.
	    </assert>
            <assert diagnostics="L1-28" test='cda:administrativeGenderCode'>
	       Error: A patient/administrativeGenderCode element
	       shall be present.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='recordTarget_warnings' name='recordTarget_warnings'
            see='&baseURI;#recordTarget'>
<!--
        <rule id='cda-recordTarget-warnings' context='cda:recordTarget/cda:patientRole/cda:patient'>
            <assert diagnostics="L1-29" 
                test='not(cda:maritalStatusCode) or
            cda:maritalStatusCode/@codeSystem = ""'>
            Warning: If maritalStatusCode,
            religiousAffiliationCode, raceCode
            and ethnicGroupCode elements are present, they should
            be encoded using appropriate HL7
            vocabularies.
	    </assert>
            <assert diagnostics="L1-29" 
                test='not(cda:religiousAffiliationCode) or cda:religiousAffiliationCode/@codeSystem = ""'/>
            <assert diagnostics="L1-29" test='not(cda:raceCode) or cda:raceCode/@codeSystem = ""'/>
            <assert diagnostics="L1-29" test='not(cda:ethnicGroupCode) or cda:ethnicGroupCode/@codeSystem = ""'/>
            
-->
            <!-- Take the effectiveTime of the document, and subtract 18 years.  If the birthTime of the 
            patient (padded to 8 digits of precision) is greater than the effective time of the document 
            (which must be to the day), then the guardian element must be present.
            -->
<!--
            <assert diagnostics="L1-30" 
                test='concat(number(substring(/cda:ClinicalDocument/cda:effectiveTime/@value,1,4)) - 18,
                substring(/cda:ClinicalDocument/cda:effectiveTime/@value, 5, 4)) &gt;
                substring(concat(substring(cda:birthTime/@value, 1, 8),"00000000"), 1, 8) or 
                count(cda:guardian) &gt; 1'/>
        </rule>
-->
    </pattern>
    
    <pattern id='author' name='author' see='&baseURI;#author'>
        <rule id='cda-author' context='cda:author'>
            <assert diagnostics="L1-31" test='cda:time'>
	    Error: The author/time element shall be present.
	    </assert>
        </rule>
        <rule id='cda-assignedAuthor' context='cda:assignedAuthor'>
            <assert diagnostics="L1-32" test='cda:id'>
	    Error: The assignedAuthor/id element shall be present.
	    </assert>
            <assert diagnostics="L1-33" test='cda:assignedPerson |
            cda:assignedAuthoringDevice'>
	    Error: An assignedAuthor element shall contain at
            least one assignedPerson or
            assignedAuthoringDevice elements.
	    </assert>
        </rule>
        <rule id='cda-assignedAuthoringDevice' context='cda:assignedAuthoringDevice'>
            <assert diagnostics="L1-34" test='cda:softwareName'>
                Error: When assignedAuthoringDevice is present, the softwareName 
                element must be present.
            </assert>
            <assert diagnostics="L1-34" test='string-length(normalize-space(cda:softwareName)) &gt; 0'>
                Error: When assignedAuthoringDevice/softwareName must have a value.
            </assert>
        </rule>
    </pattern>
    
    <pattern id='dataEnterer' name='dataEnterer' see='&baseURI;#dataEnterer'>
        <rule id='cda-dataEnterer' context='cda:dataEnterer'>
            <assert diagnostics="L1-35"
            test='cda:assignedEntity/cda:assignedPerson'>
	       Error: When dataEnterer is present, an
	       assignedEntity/assignedPerson element
	       shall be present.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='informant' name='informant' see='&baseURI;#informant'>
        <rule id='cda-informant' context='cda:informant/cda:relatedEntity'>
            <assert diagnostics='L1-36' test='@classCode = "CON" or @classCode
        = "PRS" or @classCode = "PROV"' >
	       Error: If the informant is a mutual relation, the
	       type of relationship shall be specified
	       in relatedEntity/@classCode, and shall be
	       CON, PRS or
	       PROV from the RoleClass vocabulary.
	    </assert>
        </rule>
        <rule id='cda-informant-person' context='cda:informant'>
            <assert diagnostics='L1-37' 
                test='cda:relatedEntity/cda:relatedPerson |
		cda:assignedEntity/cda:assignedPerson' >
		Error: When informant is present, an
		assignedEntity/assignedPerson or
		relatedEntity/relatedPerson element shall be present.
	    </assert>
            <assert test='not(descendant::crs:asPatientRelationship)'
        diagnostics='L1-69'>
		Warning: An informant should not have any
            assignedEntity/assignedPerson/crs:asPatientRelationshipelements, or
            relatedEntity/relatedPerson/crs:asPatientRelationship elements.
	    </assert>
        </rule>
    </pattern>
<!--
    <pattern id='informant-2' name='informant-2' see='&baseURI;#informant'>
        <rule id='cda-relatedEntity-PRS' context='cda:informant/cda:relatedEntity[@classCode = "PRS"]'>
            <assert diagnostics="L1-38" 
                test='cda:code/@codeSystem = "2.16.840.1.113883.5.111" and
        cda:code/@code =
        document("voc.xml")/systems/system[@codeSystemName="PersonalRelationshipRoleType"]/code/@value'>
               Error: When relatedEntity/@classCode is
        PRS, values in
            relatedEntity/code shall come from the
        PersonalRelationshipRoleType
            vocabulary.
	    </assert>
        </rule>
        <rule id='cda-relatedEntity-PROV' context='cda:informant/cda:relatedEntity[@classCode = "PROV"]/cda:code'>
            <assert diagnostics="L1-40" 
                test='@codeSystem = "2.16.840.1.113883.6.96" and @code = document("voc.xml")/systems/system[@codeSystemName="HealthcareProfessionals"]/code/@value'/>
        </rule>
    </pattern>
    <pattern id='informant_warnings' name='informant_warnings' see='&baseURI;#informant'>
        <rule id='cda-relatedEntity-CON-warnings' context='cda:informant/cda:relatedEntity[@classCode = "CON"]'>
            <assert diagnostics="L1-39" test='not(cda:code)'/>
        </rule>
    </pattern>
-->
    <pattern id='informationRecipient' name='informationRecipient' see='&baseURI;#informationRecipient'>
        <rule id='cda-informationRecipient' context='cda:ClinicalDocument/cda:informationRecipient'>
            <assert diagnostics="L1-41" 
                test='cda:intendedRecipient/cda:informationRecipient|cda:intendedRecipient/cda:receivedOrganization'>
               Error: When informationRecipient is used, at least
               one
            informationRecipient/intendedRecipient/informationRecipient or
            informationRecipient/intendedRecipient/recievedOrganization shall be present.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='legalAuthenticator' name='legalAuthenticator' see='&baseURI;#legalAuthenticator'>
        <rule id='cda-legalAuthenticator' context='cda:legalAuthenticator'>
            <assert diagnostics='L1-42'
        test='cda:assignedEntity/cda:assignedPerson'>
	       Error: The assignedEntity/assignedPerson element
        shall be present in a legalAuthenticator.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='authenticator' name='authenticator' see='&baseURI;#authenticator'>
        <rule id='cda-authenticator' context='cda:authenticator'>
            <assert diagnostics='L1-43'
        test='cda:assignedEntity/cda:assignedPerson'>
	       Error: The assignedEntity/assignedPerson element
        shall be present in an
            authenticator element.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='participant' name='participant' see='&baseURI;#participant'>
        <rule id='cda-associatedEntity' context='cda:participant/cda:associatedEntity'>
            <assert diagnostics="L1-44" test='cda:associatedPerson |
        cda:scopingOrganization'>
		Error: The participant/associatedEntity element
        shall have an associatedPerson
            or scopingOrganization element.
	    </assert>
            <assert diagnostics="L1-45" 
                test='not(../@typeCode = "IND") or 
                @classCode = "PRS" or @classCode = "NOK" or @classCode = "ECON" or @classCode = "GUAR"'>
                Error: When participant/@typeCode is
        IND,
            participatingEntity/@classCode shall be PRS,
        NOK, ECON or GUAR.
	    </assert>
<!--
            <assert diagnostics="L1-46" 
                test='not(../@typeCode = "IND") or 
                @classCode = "GUAR" or 
                count(cda:code/@code[.=document("voc.xml")/systems/system
                [@codeSystemName="PersonalRelationshipRoleType"]/code/@value]) = 1'
                />
-->
            <assert diagnostics="L1-47" test='not(../@typeCode="HLD") or
        @classCode = "POLHOLD"'>
	       Error: When participant/@typeCode is
        HLD,
            participatingEntity/@classCode shall be POLHOLD.
	    </assert>
            <assert diagnostics="L1-48" test='not(../@typeCode="HLD") or
        cda:scopingOrganization'>
		Error: When participant/@typeCode is
        HLD,
            participatingEntity/scopingOrganization shall be present.
	    </assert>
        </rule>     
    </pattern>
    
    <pattern id='documentationOf' name='documentationOf' see='&baseURI;#documentationOf'>
        <rule id='cda-serviceEvent' context='cda:serviceEvent'>
            <assert diagnostics="L1-50" test='@classCode = "PCPR"'>
	    Error: The value of the serviceEvent/@classCode
        attribute shall be PCPR.
	    </assert>
            <assert diagnostics="L1-53" test='cda:effectiveTime'>
	    Error: The effectiveTime element of the
        serviceEvent element shall be present.
	    </assert>
        </rule>
        <rule id='cda-documentationOf' context='cda:ClinicalDocument'>
            <assert diagnostics="L1-51" test='count(cda:documentationOf) = 1'>
                Error: Only one ClinicalDocument/documentationOf element must be present.
            </assert>
        </rule>
        <rule id='cda-effectiveTime' context='cda:serviceEvent/cda:effectiveTime'>
            <assert diagnostics="L1-54" test='count(cda:low) = 1'>
	       Error: The effectiveTime element shall contain
	       both a low and a high element.
	    </assert>
            <assert diagnostics="L1-54" test='count(cda:high) = 1'>
	       Error: The effectiveTime element shall contain
	       both a low and a high element.
	    </assert>
        </rule>
        <rule id='cda-performer' context='cda:performer/cda:assignedEntity'>
            <assert diagnostics="L1-59"
                test='count(cda:code) = 0 or
        cda:code/@codeSystem="2.16.840.1.113883.6.96"'>
	       Error: The performer/assigneEntity/code if present
	       shall have a value drawn from the SNOMED
	       CT healthcare professional subtype hierarchy.
	    </assert>
            <assert diagnostics="L1-60" test='cda:assignedPerson |
        cda:representedOrganization'>
		Error: Every performer/assignedEntity element
		shall have at least one assignedPerson or 
		representedOrganization.
	    </assert>
        </rule>
    </pattern>
    <pattern id='documentationOf_warnings' name='documentationOf_warnings' see='&baseURI;#documentationOf'>
        <rule id='cda-serviceEvent-warnings' context='cda:serviceEvent'>
            <assert diagnostics="L1-55" test='cda:performer'>
	       Warning: A serviceEvent should have at least one performer.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='componentOf' name='componentOf' see='&baseURI;componentOf'>
<!--
        <rule id='cda-componentOf' context='/cda:ClinicalDocument/cda:code'>
            <assert diagnostics='L1-61' 
                test='/cda:ClinicalDocument/cda:componentOf or 
                not(document("voc.xml")/systems/system
                [@codeSystemName="LOINC"]/code[@value = current()]/@displayName = "DISCHARGE SUMMARIZATION NOTE")'/>
        </rule>
        <rule id='cda-encompassingEncounter' context='cda:encompassingEncounter'>
            <assert diagnostics="L1-62" test='cda:id'/>
            <assert diagnostics="L1-63" test='cda:effectiveTime'/>
            <assert diagnostics="L1-64" 
                test='cda:dischargeDispositionCode or 
                not(document("voc.xml")/systems/system[@codeSystemName="LOINC"]/
                code[@value = current()/ancestor::cda:ClinicalDocument/cda:code/@code]/@displayName = 
                "DISCHARGE SUMMARIZATION NOTE")'/>
        </rule>
-->
        <rule id='cda-encounterParticipant' context='cda:encounterParticipant/cda:assignedEntity'>
            <assert diagnostics="L1-65" test='cda:assignedPerson |
        cda:representedOrganization'>
	       Error: The encounterParticipant/assignedEntity
	       element shall have at least one
	       assignedPerson or
	       representedOrganization element present.
	    </assert>
        </rule>
        <rule id='cda-responsibleParty' context='cda:responsibleParty/cda:assignedEntity'>
            <assert diagnostics="L1-66" test='cda:assignedPerson |
        cda:representedOrganization'>
	       Error: The responsibleParty/assignedEntity element
	       shall have at least one
	       assignedPerson or
	       representedOrganization element present.
	    </assert>
        </rule>
    </pattern>
    
    <pattern id='nonXMLBody_warnings' name='nonXMLBody_warnings' see='&baseURI;nonXMLBody'>
        <rule id='nonXMLBody-warnings' context='cda:nonXMLBody'>
            <assert diagnostics='L1-67' test='(cda:text = "" and
        cda:reference) or not(cda:reference)'>
	       Warning: A nonXMLBody/text should not contain both
        a reference element and
            character data.
	    </assert>
        </rule>
    </pattern>
<!--
    <pattern id='Body' name='Body' see='&baseURI;Body'>
        <rule id='sectionRequirements' context='cda:section'>
            <assert diagnostics='L2-1' test='cda:code'/>
            <assert diagnostics="L2-2" test='cda:text | cda:component'/>
            <assert diagnostics="L2-3" 
                test='string-length(string(cda:text)) &gt; 0 or count(cda:component) &gt; 0'/>
        </rule>
        
        <rule id='Level2AndRequiredSections' context='/cda:ClinicalDocument/cda:component/cda:structuredBody'>
            <assert test='/cda:ClinicalDocument/cda:templateId[@extension = "IMPL_CDAR2_LEVEL2" and 
            @root="2.16.840.1.113883.10"]'>
                This document contains a structured body.  It should also conform to Level 2 requirements.
            </assert>
            <assert diagnostics="L2-4" 
                test='descendant-or-self::cda:section/cda:code/@code="11535-2" or 
                descendant-or-self::cda:section/cda:code/@code="11450-4"'/>
            <assert diagnostics="L2-5" 
                test='descendant-or-self::cda:section/cda:code/@code="10155-0" or 
                descendant-or-self::cda:section/cda:code/@code="8658-7"'/>
        </rule>
-->
<!--
        <rule id='DischargeSections' context='/cda:ClinicalDocument[document("voc.xml")/systems/system[@codeSystemName="LOINC"]/code[
            @displayName = "DISCHARGE SUMMARIZATION NOTE"]/@value =
	    cda:code/@code]/cda:component'>
-->
            <!-- rules applicable to discharge summary
               Either it's not a discharge summary, or it has the required section.
            -->
<!--
            <assert diagnostics="L2-6" test='descendant-or-self::cda:section/cda:code/@code="10183-2"'/>
            <assert diagnostics="L2-7" test='descendant-or-self::cda:section/cda:code/@code="10160-0"'/>
            <assert diagnostics="L2-8" test='descendant-or-self::cda:section/cda:code/@code="8648-8"'/>
        </rule>
-->
<!--
        <rule id='ConflictingSections' context='cda:section/cda:code[@code="46239-0"]'>
            <assert diagnostics="L2-11" 
                test='count(//cda:section/cda:code[@code="29299-5" or @code="10154-3"])=0'/>
        </rule>     
-->
<!--
    </pattern>
-->
    
<!--
    <pattern id='Body_manual' name='Body_manual' see='&baseURI;Body'>
        <rule context='cda:section/cda:code[@code="29299-5"]'>
            <assert diagnostics='L2-9' test='false()'>
                Manually verify that this section contains a chief complaint.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code="46239-0"]'>
            <assert diagnostics='L2-9 L2-10' test='false()'>
                Manually verify that this section contains both a chief complaint and the reason for visit.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code="10154-3"]'>
            <assert diagnostics='L2-10' test='false()'>
                Manually verify that this section contains both a chief complaint and the reason for visit.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code="10154-3"]'>
            <assert diagnostics='L2-10' test='false()'>
                Manually verify that this section contains both a chief complaint and the reason for visit.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code="42349-1"]'>
            <assert diagnostics='L2-12' test='false()'>
                Manually verify that this section contains the reason for referral.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code="42348-3"]'>
            <assert diagnostics='L2-13' test='false()'>
                Manually verify that this section contains the patient's Advance Directives.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code="10164-2"]'>
            <assert diagnostics='L2-14' test='false()'>
                Manually verify that this section contains the History of Present Illness.
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "10158-4"]'>
            <assert diagnostics="L2-15" test="false()">
                Manually verify that this section contains the patient's functional status 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "10157-6"]'>
            <assert diagnostics="L2-16" test="false()">
                Manually verify that this section contains family history of the patient 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "11369-6"]'>
            <assert diagnostics="L2-17" test="false()">
                Manually verify that this section contains immunization history 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "10167-5"]'>
            <assert diagnostics="L2-18" test="false()">
                Manually verify that this section contains the patient's past surgical history 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "11346-4"]'>
            <assert diagnostics="L2-19" test="false()">
                Manually verify that this section contains only prior outpatient visits 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "11336-5"]'>
            <assert diagnostics="L2-20" test="false()">
                Manually verify that this section contains only prior hospitalizations 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "46240-8"]'>
            <assert diagnostics="L2-21" test="false()">
                Manually verify that this section contains both prior hospitalizations and prior outpatient visits 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "10187-3"]'>
            <assert diagnostics="L2-22" test="false()">
                Manually verify that this section contains the Review of Systems 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "10184-0"]'>
            <assert diagnostics="L2-23" test="false()">
                Manually verify that this section contains the Physical Examination given at Discharge from a hospital 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "22029-3"]'>
            <assert diagnostics="L2-24" test="false()">
                Manually verify that this section contains the Physical Examination at times other than discharge
                from a hospital 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "8716-3"]'>
            <assert diagnostics="L2-25" test="false()">
                Manually verify that this section contains the patient vital signs 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "46242-4"]'>
            <assert diagnostics="L2-26" test="false()">
                Manually verify that this section contains the Fetal Vital Signs 
            </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "11493-4"]'>
            <assert diagnostics="L2-27" test="false()">
                Manually verify that this section contains results or referring to other reports </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "30954-2"]'>
            <assert diagnostics="L2-27" test="false()">
                Manually verify that this section contains results or referring to other reports </assert>
        </rule>
        <rule context='cda:section/cda:code[@code = "18775-6"]'>
            <assert diagnostics="L2-28" test="false()">
                Manually verify that this section contains the plan of care for the patient 
            </assert>
        </rule>
    </pattern>
-->
    <diagnostics>
        <diagnostic id="L1-1">
            Error: All patient, guardianPerson, assignedPerson,
            maintainingPerson, relatedPerson, 
            intendedRecipient/informationRecipient, associatedPerson, and 
            relatedSubject/subject elements shall have a name.
        </diagnostic>
        <diagnostic id="L1-2">
            Error: All patientRole, assignedAuthor,
            assignedEntity[not(parent::dataEnterer)] and associatedEntity elements shall 
            have an addr and telecom element.
        </diagnostic>
        <diagnostic id="L1-3">
            Warning: All guardian, dataEnterer/assignedEntity, relatedEntity, 
            intendedRecipient, relatedSubject and participantRole elements
            should have an addr and telecom element.
        </diagnostic>
        <diagnostic id="L1-4">
            Error: All guardianOrganization, providerOrganization, 
            wholeOrganization, representedOrganization, 
            representedCustodianOrganization, recievedOrganization, scopingOrganization and serviceProviderOrganization elements shall have name, addr and telecom elements.
        </diagnostic>
        <diagnostic id="L1-5">
            Times or time intervals found in the ClinicalDocument/effectiveTime, 
            author/time, dataEnterer/time, legalAuthenticator/time, 
            authenticator/time and encompassingEncounter/effectiveTime elements shall be 
            precise to the day, shall include a time zone if more precise than to the day, and should be precise to
            the second.
        </diagnostic>
        <diagnostic id="L1-6">
            The patient/birthTime element shall be precise at least to the year, and should be precise 
            at least to the day, and may omit time zone.
        </diagnostic>
        <diagnostic id="L1-7">
            Times or time intervals found in the patient/birthTime, 
            asOrganizationPartOf/effectiveTime, asMaintainedEntity/effectiveTime, 
            relatedEntity/effectiveTime, 
            serviceEvent/effectiveTime, ClinicalDocument/participant/time, 
            serviceEvent/performer/time and encounterParticipant/time shall be precise at 
            least to the year, should be precise to the day, and may omit time zone.
        </diagnostic>
        <diagnostic id="L1-8">
            Error: Telephone numbers shall match the regular expression patterntel:\+?[-0-9().]+
        </diagnostic>
        <diagnostic id="L1-9">
            Error: At least one dialing digit shall be present in the phone number after visual separators are 
            removed.
        </diagnostic>
        <diagnostic id="L1-10">
            Error: The extension attribute of the typeId element shall be
            POCD_HD000040.
        </diagnostic>
        <diagnostic id="L1-11">
            Error: A ClinicalDocument/templateId element shall be present where the value of 
            @extension is IMPL_CDAR2_LEVEL1 and the value of @root is 
            2.16.840.1.113883.10.
        </diagnostic>
        <diagnostic id="L1-12">
            Error: The ClinicalDocument/id/@root attribute shall be a syntactically correct UUID 
            or OID.
        </diagnostic>
        <diagnostic id="L1-13">
            Error: UUIDs shall be represented in the form XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX, 
            where each X is a character from the set [A-Fa-f0-9].
        </diagnostic>
        <diagnostic id="L1-14">
            Error: OIDs shall be represented in dotted decimal notation, where each decimal number is either 0, 
            or starts with a non-zero digit.  More formally, an OID shall be in the form ([0-2])(.([1-9][0-9]*|0))+.
        </diagnostic>
        <diagnostic id="L1-15">
            Error: OIDs shall be no more than 64 characters in length.
        </diagnostic>
        <diagnostic id="L1-16">
            Error: For /ClinicalDocument/code, @code shall come from the appropriate LOINC code subset 
            listed in Table 2, @codeSysem shall be the OID for LOINC, and @codeSystemName,
            if present is LOINC.
        </diagnostic>
        <diagnostic id="L1-17">
            Manual: If pre-coordinated document type codes are used, values used in the 
            assignedAuthor/code and assignedAuthor/author/functionCode elements shall not 
            conflict with ClinicalDocument/code.
        </diagnostic>
        <diagnostic id="L1-18">
            Manual: If pre-coordinated document type codes are used, values used in 
            encompassingEncounter/location/healthCareFacility/code shall not conflict with 
            ClinicalDocument/code.
        </diagnostic>
        <diagnostic id="L1-19">
            Error: The languageCode element shall be present.
        </diagnostic>
        <diagnostic id="L1-20">
            Error: The language code shall be in the form nn, or nn-CC.
        </diagnostic>
        <diagnostic id="L1-21">
            Error: The nn portion shall be a legal ISO-639-1 language code in lower case.
        </diagnostic>
        <diagnostic id="L1-22">
            Error: The CC portion, if present shall be an ISO-3166 country code in upper case.
        </diagnostic>
        <diagnostic id="L1-23">
            Error: Both ClinicalDocument/setId and ClinicalDocument/versionNumber shall be 
            present or absent.
        </diagnostic>
        <diagnostic id="L1-24">
            Error: The @extension and/or @root of ClinicalDocument/setId and 
            ClinicalDocument/id are different when both are present.
        </diagnostic>
        <diagnostic id="L1-25">
            Error: A ClinicalDocument/copyTime element shall not be present.
        </diagnostic>
        <diagnostic id="L1-26">
            Error: At least one recordTarget/patientRole element shall be present.
        </diagnostic>
        <diagnostic id="L1-27">
            Error: A patient/birthTime element shall be present. 
        </diagnostic>
        <diagnostic id="L1-28">
            Error: A patient/administrativeGenderCode element shall be present.
        </diagnostic>
        <diagnostic id="L1-29">
            Warning: If maritalStatusCode, religiousAffiliationCode, raceCode 
            and ethnicGroupCode elements are present, they should be encoded using appropriate HL7 
            vocabularies.
        </diagnostic>
        <diagnostic id="L1-30">
            Warning: The guardian element should be present when the patient is a minor child.
        </diagnostic>
        <diagnostic id="L1-31">
            Error: The author/time element shall be present.
        </diagnostic>
        <diagnostic id="L1-32">
            Error: The assignedAuthor/id element shall be present.
        </diagnostic>
        <diagnostic id="L1-33">
            Error: An assignedAuthor element shall contain at least one assignedPerson or 
            assignedAuthoringDevice elements.
        </diagnostic>
        <diagnostic id="L1-34">
            Error: When assignedAuthoringDevice is present, the softwareName element shall 
            be present.
        </diagnostic>
        <diagnostic id="L1-35">
            Error: When dataEnterer is present, an assignedEntity/assignedPerson element 
            shall be present.
        </diagnostic>
        <diagnostic id="L1-36">
            Error: If the informant is a mutual relation, the type of relationship shall be specified 
            in relatedEntity/@classCode, and shall be CON, PRS or 
            PROV from the RoleClass vocabulary.
        </diagnostic>
        <diagnostic id="L1-37">
            Error: When informant is present, an assignedEntity/assignedPerson or 
            relatedEntity/relatedPerson element shall be present.
        </diagnostic>
        <diagnostic id="L1-38">
            Error: When relatedEntity/@classCode is PRS, values in 
            relatedEntity/code shall come from the PersonalRelationshipRoleType 
            vocabulary.
        </diagnostic>
        <diagnostic id="L1-39">
            Warning: When relatedEntity/@classCode is CON, relatedEntity/code 
            should not be present.
        </diagnostic>
        <diagnostic id="L1-40">
            Error: When relatedEntity/@classCode is PROV, and 
            relatedEntity/code is present, the value shall come from SNOMED CT.
        </diagnostic>
        <diagnostic id="L1-41">
            Error: When informationRecipient is used, at least one 
            informationRecipient/intendedRecipient/informationRecipient or 
            informationRecipient/intendedRecipient/recievedOrganization shall be present.
        </diagnostic>
        <diagnostic id="L1-42">
            Error: The assignedEntity/assignedPerson element shall be present in a legalAuthenticator.
        </diagnostic>
        <diagnostic id="L1-43">
            Error: The assignedEntity/assignedPerson element shall be present in an 
            authenticator element.
        </diagnostic>
        <diagnostic id="L1-44">
            Error: The participant/associatedEntity element shall have an associatedPerson 
            or scopingOrganization element.
        </diagnostic>
        <diagnostic id="L1-45">
            Error: When participant/@typeCode is IND, 
            participatingEntity/@classCode shall be PRS, NOK, ECON or GUAR.
        </diagnostic>
        <diagnostic id="L1-46">
            Error: When participatingEntity/@classCode is PRS, NOK or ECON then 
            participatingEntity/code shall be present having a value drawn from the 
            PersonalRelationshipRoleType domain. 
        </diagnostic>
        <diagnostic id="L1-47">
            Error: When participant/@typeCode is HLD, 
            participatingEntity/@classCode shall be POLHOLD.
        </diagnostic>
        <diagnostic id="L1-48">
            Error: When participant/@typeCode is HLD, 
            participatingEntity/scopingOrganization shall be present.
        </diagnostic>
        <diagnostic id="L1-49">
            Manual: To represent a guarantor, the @typeCode attribute shall be have a value of 
            IND, and the participatingEntity/@classCode shall have a value of 
            GUAR. 
        </diagnostic>
        <diagnostic id="L1-50">
            Error: The value of the serviceEvent/@classCode attribute shall be PCPR.
        </diagnostic>
        <diagnostic id="L1-51">
            Error: Only one ClinicalDocument/documentationOf element shall be present.
        </diagnostic>
        <diagnostic id="L1-52">
            Manual: If present, the value of serviceEvent/code shall not conflict with the 
            ClininicalDocument/code. 
        </diagnostic>
        <diagnostic id="L1-53">
            Error: The effectiveTime element of the serviceEvent element shall be present.
        </diagnostic>
        <diagnostic id="L1-54">
            Error: The effectiveTime element shall contain both a low and a 
            high element.
        </diagnostic>
        <diagnostic id="L1-55">
            Warning: A serviceEvent should have at least one performer.
        </diagnostic>
        <diagnostic id="L1-56">
            Manual: The performer elements shall list the relevant providers of healthcare during the 
            episode being summarized.   
        </diagnostic>
        <diagnostic id="L1-57">
            Error: If the provider is the primary care provider for the patient during the time interval, then 
            performer/functionCode shall have a value of PCP from the 
            ParticipationFunction vocabulary domain
        </diagnostic>
        <diagnostic id="L1-58">
            Error: If present, the values for performer/assignedEntity/code shall be drawn from SNOMED 
            CT, using concepts that descend from the healthcare professional subtype hierarchy (SNOMED 
            CT Concept ID: 223366009).
        </diagnostic>
        <diagnostic id="L1-59">
            Error: The performer/assigneEntity/code if present shall have a value drawn from the SNOMED 
            CT healthcare professional subtype hierarchy. 
        </diagnostic>
        <diagnostic id="L1-60">
            Error: Every performer/assignedEntity element shall have at least one 
            assignedPerson or representedOrganization.
        </diagnostic>
        <diagnostic id="L1-61">
            Error: If the Care Record Summary is a Discharge Summarization, then the componentOf 
            element is required.
        </diagnostic>
        <diagnostic id="L1-62">
            Error: The encompassingEncounter element shall have an id element.
        </diagnostic>
        <diagnostic id="L1-63">
            Error: The encompassingEncounter element shall have an effectiveTime element.
        </diagnostic>
        <diagnostic id="L1-64">
            Error: If ClinicalDocument/code represents a Discharge Summarization Node, then
            dischargeDispositionCode shall be present.
        </diagnostic>
        <diagnostic id="L1-65">
            Error: The encounterParticipant/assignedEntity element shall have at least one 
            assignedPerson or representedOrganization element present.
        </diagnostic>
        <diagnostic id="L1-66">
            Error: The responsibleParty/assignedEntity element shall have at least one 
            assignedPerson or representedOrganization element present.
        </diagnostic>
        <diagnostic id="L1-67">
            Warning: A nonXMLBody/text should not contain both a reference element and
            character data.
        </diagnostic>
        <diagnostic id="L1-68">
            Manual: When a portal or patient-operated kiosk is used to create the document, and the end user (e.g., 
            the patient) of the portal provides information that is entered into the document, that user shall be 
            recorded as the assignedAuthor and the application shall be recorded as an 
            assignedAuthoringDevice.
        </diagnostic>
        <diagnostic id="L1-69">
            An informant should not have any 
            assignedEntity/assignedPerson/crs:asPatientRelationshipelements, or 
            relatedEntity/relatedPerson/crs:asPatientRelationship elements.
        </diagnostic>
        <diagnostic id="L2-1">
            Error: A section element shall have a code element.
        </diagnostic>
        <diagnostic id="L2-2">
            Error: A section shall contain at least one text element or one or more 
            component elements. 
        </diagnostic>
        <diagnostic id="L2-3">
            Error: All text or component elements shall contain content.
        </diagnostic>
        <diagnostic id="L2-4">
            Error: A Care Record Summary shall include a section element whose code is 11450-4 or 11535-2.
        </diagnostic>
        <diagnostic id="L2-5">
            Error: A section shall be present with a code value of 10155-0 
            or 8658-7.
        </diagnostic>
        <diagnostic id="L2-6">
            Error: A Discharge summary shall include a section element whose code is 
            10183-2.
        </diagnostic>
        <diagnostic id="L2-7">
            Error: A Summary of Episode note that is not also a discharge summary shall include a 
            section element whose code is 10160-0.
        </diagnostic>
        <diagnostic id="L2-8">
            Error: A level 2 conforming Care Record Summary that is a discharge summary shall contain a 
            section with the code value of 8648-8.
        </diagnostic>
        <diagnostic id="L2-9">
            Manual: The section type code for the section describing the reason for visit in a level 2 
            conforming Care Record Summary shall be either 46239-0 (CHIEF COMPLAINT+REASON FOR VISIT), 
            or 29299-5 (REASON FOR VISIT).
        </diagnostic>
        <diagnostic id="L2-10">
            Manual: The section type code for the section describing the patient's chief complaint in a level 2 
            conforming Care Record Summary shall be either 46239-0 (CHIEF COMPLAINT+REASON FOR VISIT), 
            or 10154-3 (CHIEF COMPLAINT).
        </diagnostic>
        <diagnostic id="L2-11">
            Error: A level 2 conforming Care Record Summary that contains a section with a 
            code value of 46239-0 (CHIEF COMPLAINT+REASON FOR VISIT) shall not contain 
            sections with a code value of 29299-5 (REASON FOR VISIT) or 10154-3 (CHIEF 
            COMPLAINT), and vice versa.
        </diagnostic>
        <diagnostic id="L2-12">
            Manual: The code for the section describing the Reason for Referral in a level 
            2 conforming Care Record Summary shall be 42349-1 (REASON FOR REFERRAL).
        </diagnostic>
        <diagnostic id="L2-13">
            Manual: The code for the section describing the patient's Advance Directives 
            in a level 2 conforming Care Record Summary SHALL be 42348-3 (ADVANCE DIRECTIVES).
        </diagnostic>
        <diagnostic id="L2-14">
            Manual: The code for the section describing the History of Present Illness in 
            a level 2 conforming Care Record Summary SHALL be 10164-2 (HISTORY OF PRESENT ILLNESS).
        </diagnostic>
        <diagnostic id="L2-15">
            Manual: The LOINC section type code for the section describing the patient's functional 
            status in a level 2 conforming Care Record Summary shall be 10158-4 (HISTORY OF FUNCTIONAL 
            STATUS).
        </diagnostic>
        <diagnostic id="L2-16">
            Manual: The LOINC section type code for the section providing family history of the patient 
            in a level 2 conforming Care Record Summary shall be 10157-6 (HISTORY OF FAMILY MEMBER 
            DISEASES).
        </diagnostic>
        <diagnostic id="L2-17">
            Manual: The LOINC section type code for the section providing immunization 
            history in a level 2 conforming Care Record Summary shall be 11369-6 (HISTORY OF 
            IMMUNIZATION).
        </diagnostic>
        <diagnostic id="L2-18">
            Manual: The LOINC section type code for the section describing the patient's past surgical 
            history in a level 2 conforming Care Record Summary shall be 10167-5 (PAST SURGICAL 
            HISTORY).
        </diagnostic>
        <diagnostic id="L2-19">
            Manual: The LOINC section code used for the section describing only prior outpatient visits 
            in a level 2 conforming Care Record Summary shall be 11346-4 (HISTORY OF OUTPATIENT 
            VISITS).
        </diagnostic>
        <diagnostic id="L2-20">
            Manual: The LOINC section code used for the section describing only prior hospitalizations 
            in a level 2 conforming Care Record Summary shall be 11336-5 (HISTORY OF HOSPITALIZATIONS).
        </diagnostic>
        <diagnostic id="L2-21">
            Manual: The LOINC section code used for the section describing both prior hospitalizations 
            and prior outpatient visits in a level 2 conforming Care Record Summary shall be 46240-8 
            (HISTORY OF HOSPITALIZATIONS+HISTORY OF OUTPATIENT VISITS).
        </diagnostic>
        <diagnostic id="L2-22">
            Manual: The LOINC section code used for the section describing the Review of Systems in a 
            level 2 conforming Care Record Summary shall be 10187-3 (REVIEW OF SYSTEMS).
        </diagnostic>
        <diagnostic id="L2-23">
            Manual: The LOINC section code used for the section describing the Physical Examination 
            given at Discharge from a hospital in a level 2 conforming Care Record Summary shall be 
            10184-0 (HOSPITAL DISCHARGE PHYSICAL).
        </diagnostic>
        <diagnostic id="L2-24">
            Manual: The LOINC section code used for the section describing the Physical Examination at 
            times other than discharge from a hospital in a level 2 conforming Care Record Summary shall be 
            22029-3 (PHYSICAL EXAM.TOTAL).
        </diagnostic>
        <diagnostic id="L2-25">
            Manual: The LOINC section code used for the section providing the patient vital signs in a 
            level 2 conforming Care Record Summary shall be 8716-3 (VITAL SIGNS, PHYSICAL FINDINGS).
        </diagnostic>
        <diagnostic id="L2-26">
            Manual: The LOINC section code used for the section describing the Fetal Vital Signs in a 
            level 2 conforming Care Record Summary shall be 46242-4 (VITAL MEASUREMENTS, FETUS )
        </diagnostic>
        <diagnostic id="L2-27">
            Manual: The LOINC section code used for the section describing results or referring to 
            other reports in a level 2 conforming Care Record Summary shall be 11493-4 (HOSPITAL 
            DISCHARGE STUDIES SUMMARY), or 30954-2 (RELEVANT DIAGNOSTIC TESTS AND/OR LABORATORY DATA)
        </diagnostic>
        <diagnostic id="L2-28">
            Manual: The LOINC section code used for the section describing the plan of care for the 
            patient in a level 2 conforming Care Record Summary shall be 18775-6 (TREATMENT PLAN).
        </diagnostic>
    </diagnostics>
</schema>

