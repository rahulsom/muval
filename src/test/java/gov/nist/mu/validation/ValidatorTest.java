package gov.nist.mu.validation;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.InputStream;
import java.util.stream.Stream;

import static gov.nist.mu.validation.Rulesets.*;
import static gov.nist.mu.validation.Validator.validate;
import static org.assertj.core.api.Assertions.assertThat;

class ValidatorTest {

    private InputStream file(String resourceName) {
        return this.getClass().getClassLoader().getResourceAsStream(resourceName);
    }

    @Test
    void sampleCcdShouldValidate() {
        var result = validate(Cdar2c32, file("SampleCCDDocument.xml"), Ccd, Cda4Cdt, C32_v_2_5_c83_2_0);

        assertThat(result.getAllIssues()).hasSize(98);
        assertThat(result.getErrors()).hasSize(50);
        assertThat(result.getOtherIssues()).isEmpty();
    }

    static Stream<Arguments> muRevTestData() {
        return Stream.of(
                Arguments.of("MUExamplesJan2011/MU_Rev0_HITSP_BaseC32v2.5_RequiredTemplateIds_FourErrors.xml", 4),
                Arguments.of("MUExamplesJan2011/MU_Rev1_HITSP_C32C83_4Sections_NoInformationEntries_NoErrors.xml", 32),
                Arguments.of("MUExamplesJan2011/MU_Rev2_HITSP_C32C83_4Sections_MeaningfulEntryContent_NoErrors.xml", 53),
                Arguments.of("MUExamplesJan2011/MU_Rev3_HITSP_C32C83_4Sections_RobustEntries_NoErrors.xml", 44)
        );
    }

    @ParameterizedTest
    @MethodSource("muRevTestData")
    void muRevTests(String fileName, int expectedAllIssues) {
        var result = validate(Cdar2c32,
                file(fileName),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        );

        assertThat(result.getAllIssues()).hasSize(expectedAllIssues);
        assertThat(result.getErrors()).isEmpty();
        assertThat(result.getOtherIssues()).isEmpty();
    }

    @Test
    void bppcHasNoErrors() {
        var result = validate(Cdar2c32, file("IHE_BPPC_2010Dec10/BPPCExampleFromIHE.xml"), IheBppc);

        assertThat(result.getAllIssues()).hasSize(2);
        assertThat(result.getErrors()).isEmpty();
        assertThat(result.getOtherIssues()).isEmpty();
    }
}