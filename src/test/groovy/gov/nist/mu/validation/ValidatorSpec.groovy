package gov.nist.mu.validation

import spock.lang.Specification

class ValidatorSpec extends Specification {
    
    private InputStream file(String resourceName) {
        this.class.getClassLoader().getResourceAsStream(resourceName)
    }

    def "sample ccd should validate"() {
        when: "I validate a CCD"
        def result = Validator.validate(Rulesets.Cdar2c32,
                file('SampleCCDDocument.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 98 issues"
        result.validationResults*.issue.flatten().size() == 98
        result.validationResults*.issue.findAll { it.severity == 'errors' }.size() == 0
    }

    def "MU Rev0 has 0 errors"() {
        when: "I validate a CCD"
        def result = Validator.validate(Rulesets.Cdar2c32,
                file('MUExamplesJan2011/MU_Rev0_HITSP_BaseC32v2.5_RequiredTemplateIds_FourErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 4 issues "
        result.validationResults*.issue.flatten().size() == 4
        result.validationResults*.issue.findAll { it.severity == 'errors' }.size() == 0
    }

    def "MU Rev1 has no errors"() {
        when: "I validate a CCD"
        def result = Validator.validate(Rulesets.Cdar2c32,
                file('MUExamplesJan2011/MU_Rev1_HITSP_C32C83_4Sections_NoInformationEntries_NoErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 32 issues "
        result.validationResults*.issue.flatten().size() == 32
        result.validationResults*.issue.findAll { it.severity == 'errors' }.size() == 0
    }

    def "MU Rev2 has no errors"() {
        when: "I validate a CCD"
        def result = Validator.validate(Rulesets.Cdar2c32,
                file('MUExamplesJan2011/MU_Rev2_HITSP_C32C83_4Sections_MeaningfulEntryContent_NoErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 53 issues "
        result.validationResults*.issue.flatten().size() == 53
        result.validationResults*.issue.findAll { it.severity == 'errors' }.size() == 0
    }

    def "MU Rev3 has no errors"() {
        when: "I validate a CCD"
        def result = Validator.validate(Rulesets.Cdar2c32,
                file('MUExamplesJan2011/MU_Rev3_HITSP_C32C83_4Sections_RobustEntries_NoErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 44 issues "
        result.validationResults*.issue.flatten().size() == 44
        result.validationResults*.issue.findAll { it.severity == 'errors' }.size() == 0
    }

    def "BPPC has no errors"() {
        when: "I validate a CCD"
        def result = Validator.validate(Rulesets.Cdar2c32,
                file('IHE_BPPC_2010Dec10/BPPCExampleFromIHE.xml'),
                Rulesets.IheBppc
        )

        then: "There are 0 errors and 2 issues "
        result.validationResults*.issue.flatten().size() == 2
        result.validationResults*.issue.findAll { it.severity == 'errors' }.size() == 0
    }
}
