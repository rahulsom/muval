package gov.nist.mu.validation;

import org.junit.jupiter.api.Test;

import java.io.InputStream;

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

    @Test
    void muRev0HasZeroErrors() {
        var result = validate(Cdar2c32,
                file("MUExamplesJan2011/MU_Rev0_HITSP_BaseC32v2.5_RequiredTemplateIds_FourErrors.xml"),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        );

        assertThat(result.getAllIssues()).hasSize(4);
        assertThat(result.getErrors()).hasSize(0);
        assertThat(result.getOtherIssues()).isEmpty();
    }

    @Test
    void muRev1HasNoErrors() {
        var result = validate(Cdar2c32,
                file("MUExamplesJan2011/MU_Rev1_HITSP_C32C83_4Sections_NoInformationEntries_NoErrors.xml"),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        );

        assertThat(result.getAllIssues()).hasSize(32);
        assertThat(result.getErrors()).hasSize(0);
        assertThat(result.getOtherIssues()).isEmpty();
    }

    @Test
    void muRev2HasNoErrors() {
        var result = validate(Cdar2c32,
                file("MUExamplesJan2011/MU_Rev2_HITSP_C32C83_4Sections_MeaningfulEntryContent_NoErrors.xml"),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        );

        assertThat(result.getAllIssues()).hasSize(53);
        assertThat(result.getErrors()).hasSize(0);
        assertThat(result.getOtherIssues()).isEmpty();
    }

    @Test
    void muRev3HasNoErrors() {
        var result = validate(Cdar2c32,
                file("MUExamplesJan2011/MU_Rev3_HITSP_C32C83_4Sections_RobustEntries_NoErrors.xml"),
                Ccd, Cda4Cdt, C32_v_2_5_c83_2_0
        );

        assertThat(result.getAllIssues()).hasSize(44);
        assertThat(result.getErrors()).hasSize(0);
        assertThat(result.getOtherIssues()).isEmpty();
    }

    @Test
    void bppcHasNoErrors() {
        var result = validate(Cdar2c32, file("IHE_BPPC_2010Dec10/BPPCExampleFromIHE.xml"), IheBppc);

        assertThat(result.getAllIssues()).hasSize(2);
        assertThat(result.getErrors()).hasSize(0);
        assertThat(result.getOtherIssues()).isEmpty();
    }
}