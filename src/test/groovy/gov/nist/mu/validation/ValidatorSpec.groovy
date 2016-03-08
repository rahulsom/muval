package gov.nist.mu.validation

import spock.lang.Specification

class ValidatorSpec extends Specification {
    def "sample ccd should validate"() {
        when: "I validate a CCD"
        def results = Validator.validate(
                file('SampleCCDDocument.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_V25_C83_20
        )

        then: "There are 3 results"
        results.size() == 3

        and: "Some other assertion"
        results*.issues.flatten().findAll().size() == 54
    }

    private InputStream file(String resourceName) {
        this.class.getClassLoader().getResourceAsStream(resourceName)
    }

    def "MU Rev0 has 4 errors"() {
        when: "I validate a CCD"
        def results = Validator.validate(
                file('MUExamplesJan2011/MU_Rev0_HITSP_BaseC32v2.5_RequiredTemplateIds_FourErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_V25_C83_20
        )

        then: "There are 3 results"
        results.size() == 3

        and: "Some other assertion"
        results*.issues.flatten().findAll().size() == 4
    }

    def "MU Rev1 has no errors"() {
        when: "I validate a CCD"
        def results = Validator.validate(
                file('MUExamplesJan2011/MU_Rev1_HITSP_C32C83_4Sections_NoInformationEntries_NoErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_V25_C83_20
        )

        then: "There are 3 results"
        results.size() == 3

        and: "Some other assertion"
        results*.issues.flatten().findAll().size() == 0
    }

    def "MU Rev2 has no errors"() {
        when: "I validate a CCD"
        def results = Validator.validate(
                file('MUExamplesJan2011/MU_Rev2_HITSP_C32C83_4Sections_MeaningfulEntryContent_NoErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_V25_C83_20
        )

        then: "There are 3 results"
        results.size() == 3

        and: "Some other assertion"
        results*.issues.flatten().findAll().size() == 0
    }

    def "MU Rev3 has no errors"() {
        when: "I validate a CCD"
        def results = Validator.validate(
                file('MUExamplesJan2011/MU_Rev3_HITSP_C32C83_4Sections_RobustEntries_NoErrors.xml'),
                Rulesets.Ccd, Rulesets.Cda4Cdt, Rulesets.C32_V25_C83_20
        )

        then: "There are 3 results"
        results.size() == 3

        and: "Some other assertion"
        results*.issues.flatten().findAll().size() == 0
    }

    def "BPPC has no errors"() {
        when: "I validate a CCD"
        def results = Validator.validate(
                file('IHE_BPPC_2010Dec10/BPPCExampleFromIHE.xml'),
                Rulesets.IheBppc
        )

        then: "There are 3 results"
        results.size() == 1

        and: "Some other assertion"
        results*.issues.flatten().findAll().size() == 2
    }
}
