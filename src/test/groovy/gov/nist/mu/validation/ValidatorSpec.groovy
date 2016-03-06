package gov.nist.mu.validation

// tag::sampletest[]
import spock.lang.Specification

class ValidatorSpec extends Specification {
    def "sample ccd should validate"() {
        when: "I validate a CCD"
        def nodes = Validator.validate(
                this.class.getClassLoader().getResourceAsStream('SampleCCDDocument.xml'),
                [Rulesets.ccd, Rulesets.cda4cdt, Rulesets.c32_v25_c83_20] as Ruleset[]
        )

        then: "There are 3 nodes"
        nodes.size() == 3

        and: "Some other assertion"
// end::sampletest[]
    }
}
