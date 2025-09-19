package gov.nist.mu.validation;

/**
 * Constants of all rulesets.
 *
 */
public class Rulesets {

    /**
     * Stylesheet for schematron
     */
    public static final Stylesheet stylesheet = new Stylesheet("hitspValidation/schematron", "schematron-Validator-report.xsl");
    /**
     * CDA R2
     * HL7 CDA R2 (with no extensions)
     */
    public static final Schema Cdar2 = new Schema("hitspValidation/schema/cdar2/infrastructure/cda", "CDA.xsd");

    /**
     * CCD
     * Continuity of Care Document
     */
    public static final Schematron Ccd = new Schematron("hitspValidation/schematron/ccd", "ccd.sch");

    /**
     * CRS Level 1 &amp; 2
     * HL7 Care Record Summary
     */
    public static final Schematron Crs = new Schematron("hitspValidation/schematron/crs", "crs.sch");

    /**
     * CRS Level 1 (With IHE PCC Modifications)
     * HL7 Care Record Summary (With IHE PCC Modifications)
     */
    public static final Schematron CrsIhe = new Schematron("hitspValidation/schematron/crsIhe", "crs.sch");

    /**
     * CDA4CDT (header only)
     * HL7 CDA For Common Document Types (CDA4CDT) -- header only
     */
    public static final Schematron Cda4Cdt = new Schematron("hitspValidation/schematron/cda4cdt", "HandP.sch");

    /**
     * CDA4CDT (header only and with IHE modifications)
     * HL7 CDA For Common Document Types (CDA4CDT) -- header only and with IHE modifications
     */
    public static final Schematron Cda4CdtIhe = new Schematron("hitspValidation/schematron/cda4cdt", "HandP.IHE.PCC.sch");

    /**
     * HITSP/C32 v2.5 -- HITSP/C83 v2.0
     * HITSP/C32 v2.5 Summary Documents Using HL7 CCD
     */
    public static final Schematron C32_v_2_5_c83_2_0 = new Schematron("hitspValidation/schematron/c32_v_2_5_c83_2_0", "HITSP_C32.sch");

    /**
     * HITSP/C32 (IWG -- IP)
     * HITSP/C32 v2.5 Summary Documents Using HL7 CCD (as modified by Interoperability Workgroup for INPATIENT Encounters) - (BETA!)
     */
    public static final Schematron C32_iwg = new Schematron("hitspValidation/schematron/c32_iwg", "iwg.sch");

    /**
     * HITSP/C32 v2.5 -- HITSP/C83 v1.1
     * HITSP/C32 v2.5 Summary Documents Using HL7 CCD (using HITSP/C83 v1.1)
     */
    public static final Schematron C32_v2_5 = new Schematron("hitspValidation/schematron/c32_v_2_5", "HITSP_C32.sch");

    /**
     * HITSP/C32 v2.4
     * HITSP/C32 v2.4 Summary Documents Using HL7 CCD (using HITSP/C83 v1.0)
     */
    public static final Schematron C32_v2_4 = new Schematron("hitspValidation/schematron/new/c32", "new_c32.sch");

    /**
     * HITSP/C32 v2.1
     * HITSP/C32 v2.1 Summary Documents Using HL7 CCD
     */
    public static final Schematron C32 = new Schematron("hitspValidation/schematron/c32", "HITSP_C32.sch");

    /**
     * PHMR v1.1
     * HL7 Personal Healthcare Monitoring Report Release 1.1
     */
    public static final Schematron Phmr = new Schematron("hitspValidation/schematron/phmr", "PHMR.sch");

    /**
     * NHIN Summary Patient Record
     * NHIN Summary Patient Record (based on HITSP/C32)
     */
    public static final Schematron SummaryPatientRecord = new Schematron("hitspValidation/schematron/nhin/summaryPatientRecord", "summaryPatientRecord.sch");

    /**
     * CDA R2 (With IHE LAB Extensions)
     * HL7 CDA R2 (With IHE LAB Extensions)
     */
    public static final Schema Cdar2ihelab = new Schema("hitspValidation/schema/cdar2ihelab/infrastructure/cda", "LabCDA.xsd");

    /**
     * CDA R2 (With HITSP Extensions)
     * HL7 CDA R2 (With HITSP Extensions)
     */
    public static final Schema Cdar2c32 = new Schema("hitspValidation/schema/cdar2c32/infrastructure/cda", "C32_CDA.xsd");

    /**
     * CDA R2 (With IHE PCC Extensions)
     * HL7 CDA R2 (With IHE PCC Extensions)
     */
    public static final Schema Cdar2pcc = new Schema("hitspValidation/schema/cdar2pcc/infrastructure/cda", "PCC_CDA.xsd");

    /**
     * CDA R2 (With IHE PCC/LAB Extensions)
     * HL7 CDA R2 (With IHE PCC/LAB Extensions)
     */
    public static final Schema Cdar2ihe = new Schema("hitspValidation/schema/cdar2ihe/infrastructure/cda", "IHE_CDA.xsd");

    /**
     * IHE Lab v4.0
     * IHE Laboratory Report -- v4.0
     */
    public static final Schematron IheLab40 = new Schematron("hitspValidation/schematron/ihe_lab_40", "iheLab4_0.sch");

    /**
     * IHE Lab v3.0
     * IHE Laboratory Report -- v3.0
     */
    public static final Schematron IheLab2011 = new Schematron("hitspValidation/schematron/IHELab2011", "HITSP_C37.sch");

    /**
     * IHE Lab 2008
     * IHE Laboratory Report -- 2008
     */
    public static final Schematron IheLab = new Schematron("hitspValidation/schematron/newLab", "HITSP_C37.sch");

    /**
     * HITSP/C37
     * IHE Laboratory Report -- 2007
     */
    public static final Schematron C37 = new Schematron("hitspValidation/schematron/c37", "HITSP_C37.sch");

    /**
     * HITSP/C28 (Nursing)
     * IHE PCC - Emergency Department Nursing Note -- 2008
     */
    public static final Schematron C28nursing = new Schematron("hitspValidation/schematron/c28", "edNursingNote.sch");

    /**
     * HITSP/C28 (Physician)
     * IHE PCC - Emergency Department Physician Note -- 2008
     */
    public static final Schematron C28physician = new Schematron("hitspValidation/schematron/c28", "edPhysicianNote.sch");

    /**
     * HITSP/C28 (Triage)
     * IHE PCC - Emergency Department Triage Note -- 2008
     */
    public static final Schematron C28triage = new Schematron("hitspValidation/schematron/c28", "edTriageNote.sch");

    /**
     * IHE EDES Nursing Note
     * IHE PCC - Emergency Department Nursing Note -- 2012
     */
    public static final Schematron EdNursing = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "edNursingNote.sch");

    /**
     * IHE EDES Physician Note
     * IHE PCC - Emergency Department Physician Note -- 2012
     */
    public static final Schematron EdPhysician = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "edPhysicianNote.sch");

    /**
     * IHE EDES Triage Note
     * IHE PCC - Emergency Department Triage Note -- 2012
     */
    public static final Schematron EdTriage = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "edTriageNote.sch");

    /**
     * IHE EDES Composite Triage and Nursing Note
     * IHE PCC - Emergency Department Composite Triage and Nursing Note -- 2012
     */
    public static final Schematron EdComposite = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "edComposite.sch");

    /**
     * HITSP/C78 v1.1
     * HITSP/C78 Immunization Document Component
     */
    public static final Schematron C78_1_1 = new Schematron("hitspValidation/schematron/c78_1_1", "HITSP_C78.sch");

    /**
     * HITSP/C78 v1.0
     * HITSP/C78 Immunization Document Component v1.0
     */
    public static final Schematron C78 = new Schematron("hitspValidation/schematron/c78", "HITSP_C78.sch");

    /**
     * HITSP/C48 Referral v2.5 -- HITSP/C83 v1.1
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.5 (using HITSP/C83 v1.1) -- Referral
     */
    public static final Schematron C48ref_2_5 = new Schematron("hitspValidation/schematron/c48_2_5", "HITSP_C48_ref.sch");

    /**
     * HITSP/C48 Discharge v2.5 -- HITSP/C83 v1.1
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.5 (using HITSP/C83 v1.1)-- Discharge
     */
    public static final Schematron C48dis_2_5 = new Schematron("hitspValidation/schematron/c48_2_5", "HITSP_C48_dis.sch");

    /**
     * HITSP/C48 Referral v2.4
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.4 -- Referral
     */
    public static final Schematron C48ref = new Schematron("hitspValidation/schematron/c48", "HITSP_C48_ref.sch");

    /**
     * HITSP/C48 Discharge v2.4
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.4 -- Discharge
     */
    public static final Schematron C48dis = new Schematron("hitspValidation/schematron/c48", "HITSP_C48_dis.sch");

    /**
     * XDS-MS Referral Summary
     * IHE PCC - XDS-MS Referral Summary -- 2012
     */
    public static final Schematron IheXdsMsReferral = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "xdsMsReferral.sch");

    /**
     * XDS-MS Discharge Summary
     * IHE PCC - XDS-MS Discharge Summary -- 2012
     */
    public static final Schematron IheXdsMsDischarge = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "xdsMsDischarge.sch");

    /**
     * IHE ED Referral
     * IHE PCC - Emergency Department Referral -- 2012
     */
    public static final Schematron IheEdReferral = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "edReferral.sch");

    /**
     * IHE PHR Extract
     * IHE PCC - PHR Extract (from XPHR Profile) -- 2012
     */
    public static final Schematron IhePhrExtract = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "xphrExtract.sch");

    /**
     * IHE PHR Update
     * IHE PCC - PHR Update (from XPHR Profile) -- 2012
     */
    public static final Schematron IhePhrUpdate = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "xphrUpdate.sch");

    /**
     * IHE APS
     * IHE PCC - Antepartum Summary -- 2012
     */
    public static final Schematron IheAps = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "aps.sch");

    /**
     * IHE APHP
     * IHE PCC - Antepartum History and Physical -- 2012
     */
    public static final Schematron IheAphp = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "aphp.sch");

    /**
     * IHE APE
     * IHE PCC - Antepartum Education -- 2012
     */
    public static final Schematron IheApe = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ape.sch");

    /**
     * IHE IC
     * IHE PCC - Immunization Content -- 2012
     */
    public static final Schematron IheId = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "immunizationDetail.sch");

    /**
     * IHE CRD
     * IHE QRPH - Clinical Research Data Capture (CRD) -- CCD Option Only! -- 2010
     */
    public static final Schematron IheCrd = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "crd.sch");

    /**
     * IHE BPPC
     * IHE Basic Patient Privacy Concern -- 2010
     */
    public static final Schematron IheBppc = new Schematron("hitspValidation/schematron/ihe/bppc", "BPPC.sch");

    /**
     * IHE MDS
     * IHE PCC - Labor and Delivery Record - Maternal Discharge Summary -- 2012
     */
    public static final Schematron IheMds = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "mds.sch");

    /**
     * IHE LDS
     * IHE PCC - Labor and Delivery Record - Labor and Delivery Summary -- 2012
     */
    public static final Schematron IheLds = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "lds.sch");

    /**
     * IHE LDHP
     * IHE PCC - Labor and Delivery Record - Labor and Delivery Admission History and Physical -- 2012
     */
    public static final Schematron IheLdhp = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ldhp.sch");

    /**
     * IHE ENS
     * IHE PCC - eNursing Summary -- 2012
     */
    public static final Schematron IheEns = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ens.sch");

    /**
     * IHE PPVS
     * IHE PCC - Postpartum Visit Summary -- 2012
     */
    public static final Schematron IhePpvs = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ppvs.sch");

    /**
     * IHE PPOC
     * IHE PCC - Patient Plan of Care (Care Plan Specification) -- 2012
     */
    public static final Schematron IhePpoc = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ppoc.sch");

    /**
     * IHE NDS
     * IHE PCC - Newborn Discharge Summary -- 2012
     */
    public static final Schematron IheNds = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "nds.sch");

    /**
     * IHE PRPH-CA
     * IHE QRPH - Physician Reporting to a Public Health Repository - Cancer Registry -- 2011
     */
    public static final Schematron IhePrphca = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "prphca.sch");

    /**
     * IHE PRPH-CA CONNECTATHON VERSION
     * IHE QRPH - Physician Reporting to a Public Health Repository - Cancer Registry -- 2011 -- Connectathon Version (includes changes from CP-QRPH-0057)
     */
    public static final Schematron IhePrphcaConnectathon = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "prphca-connectathon.sch");

    /**
     * IHE EHCP
     * IHE QRPH - Early Hearing Care Plan -- 2012
     */
    public static final Schematron IheEhcp = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ehcp.sch");

    /**
     * NHSR
     * NHSR - Newborn Hearing Screening Result
     */
    public static final Schematron Nhsr = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "nhsr.sch");

    /**
     * IHE LDSVR
     * IHE QRPH - Labor and Delivery Summary for Vital Records -- 2012
     */
    public static final Schematron IheLdsVr = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "ldsvr.sch");

    /**
     * IHE RECON
     * IHE PCC RECON - Reconciliation of Diagnoses, Allergies and Medications -- 2012
     */
    public static final Schematron IheRecon = new Schematron("hitspValidation/schematron/ihe_pcc_7_0", "recon.sch");

    /**
     * HL7 QRDA Category I
     * HL7 Quality Reporting Document Architecture (QRDA) - Category I
     */
    public static final Schematron Hl7QrdaCat1 = new Schematron("hitspValidation/schematron/quality", "qrdaCat1.sch");

    /**
     * HL7 QRDA BMI
     * HL7 Quality Reporting Document Architecture (QRDA) - Pediatric Body Mass Index Percentile (BMI)
     */
    public static final Schematron Hl7QrdaBmi = new Schematron("hitspValidation/schematron/quality", "bmi.sch");

}