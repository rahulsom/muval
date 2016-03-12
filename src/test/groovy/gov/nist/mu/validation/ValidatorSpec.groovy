package gov.nist.mu.validation

import spock.lang.Specification

import static gov.nist.mu.validation.Rulesets.*
import static gov.nist.mu.validation.Validator.validate

class ValidatorSpec extends Specification {

    private InputStream file(String resourceName) {
        this.class.getClassLoader().getResourceAsStream(resourceName)
    }

    def "sample ccd should validate"() {
        when: "I validate a CCD"
        def result = validate(Cdar2c32, file('SampleCCDDocument.xml'), Ccd, Cda4Cdt, C32_v_2_5_c83_2_0)

        then: "There are 50 errors and 98 issues"
        result.allIssues.size() == 98
        result.errors.size() == 50
        result.otherIssues.isEmpty()
    }

    def "MU Rev0 has 0 errors"() {
        when: "I validate a CCD"
        def result = validate(Cdar2c32,
                file('MUExamplesJan2011/MU_Rev0_HITSP_BaseC32v2.5_RequiredTemplateIds_FourErrors.xml'),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 4 issues "
        result.allIssues.size() == 4
        result.errors.size() == 0
        result.otherIssues.isEmpty()
    }

    def "MU Rev1 has no errors"() {
        when: "I validate a CCD"
        def result = validate(Cdar2c32,
                file('MUExamplesJan2011/MU_Rev1_HITSP_C32C83_4Sections_NoInformationEntries_NoErrors.xml'),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 32 issues "
        result.allIssues.size() == 32
        result.errors.size() == 0
        result.otherIssues.isEmpty()
    }

    def "MU Rev2 has no errors"() {
        when: "I validate a CCD"
        def result = validate(Cdar2c32,
                file('MUExamplesJan2011/MU_Rev2_HITSP_C32C83_4Sections_MeaningfulEntryContent_NoErrors.xml'),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 53 issues "
        result.allIssues.size() == 53
        result.errors.size() == 0
        result.otherIssues.isEmpty()
    }

    def "MU Rev3 has no errors"() {
        when: "I validate a CCD"
        def result = validate(Cdar2c32,
                file('MUExamplesJan2011/MU_Rev3_HITSP_C32C83_4Sections_RobustEntries_NoErrors.xml'),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        )

        then: "There are 0 errors and 44 issues "
        result.allIssues.size() == 44
        result.errors.size() == 0
        result.otherIssues.isEmpty()
    }

    def "BPPC has no errors"() {
        when: "I validate a CCD"
        def result = validate(Cdar2c32, file('IHE_BPPC_2010Dec10/BPPCExampleFromIHE.xml'), IheBppc)

        then: "There are 0 errors and 2 issues "
        result.allIssues.size() == 2
        result.errors.size() == 0
        result.otherIssues.isEmpty()
    }
}
