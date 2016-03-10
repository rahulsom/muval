package gov.nist.mu.validation;

class Rulesets {

    /**
     * Stylesheet for schematron
     */
    public static final Ruleset stylesheet = new Ruleset("hitspValidation/schematron", "schematron-Validator-report.xsl", "stylesheet");
    /**
     * CDA R2
     * HL7 CDA R2 (with no extensions)
     */
    public static final Ruleset Cdar2 = new Ruleset("hitspValidation/schema/cdar2/infrastructure/cda", "CDA.xsd", "schema");

    /**
     * CCD
     * Continuity of Care Document
     */
    public static final Ruleset Ccd = new Ruleset("hitspValidation/schematron/ccd", "ccd.sch", "schematron");

    /**
     * CRS Level 1 & 2
     * HL7 Care Record Summary
     */
    public static final Ruleset Crs = new Ruleset("hitspValidation/schematron/crs", "crs.sch", "schematron");

    /**
     * CRS Level 1 (With IHE PCC Modifications)
     * HL7 Care Record Summary (With IHE PCC Modifications)
     */
    public static final Ruleset CrsIhe = new Ruleset("hitspValidation/schematron/crsIhe", "crs.sch", "schematron");

    /**
     * CDA4CDT (header only)
     * HL7 CDA For Common Document Types (CDA4CDT) -- header only
     */
    public static final Ruleset Cda4Cdt = new Ruleset("hitspValidation/schematron/cda4cdt", "HandP.sch", "schematron");

    /**
     * CDA4CDT (header only and with IHE modifications)
     * HL7 CDA For Common Document Types (CDA4CDT) -- header only and with IHE modifications
     */
    public static final Ruleset Cda4CdtIhe = new Ruleset("hitspValidation/schematron/cda4cdt", "HandP.IHE.PCC.sch", "schematron");

    /**
     * HITSP/C32 v2.5 -- HITSP/C83 v2.0
     * HITSP/C32 v2.5 Summary Documents Using HL7 CCD
     */
    public static final Ruleset C32_v_2_5_c83_2_0 = new Ruleset("hitspValidation/schematron/c32_v_2_5_c83_2_0", "HITSP_C32.sch", "schematron");

    /**
     * HITSP/C32 (IWG -- IP)
     * HITSP/C32 v2.5 Summary Documents Using HL7 CCD (as modified by Interoperability Workgroup for INPATIENT Encounters) - (BETA!)
     */
    public static final Ruleset C32_iwg = new Ruleset("hitspValidation/schematron/c32_iwg", "iwg.sch", "schematron");

    /**
     * HITSP/C32 v2.5 -- HITSP/C83 v1.1
     * HITSP/C32 v2.5 Summary Documents Using HL7 CCD (using HITSP/C83 v1.1)
     */
    public static final Ruleset C32_v2_5 = new Ruleset("hitspValidation/schematron/c32_v_2_5", "HITSP_C32.sch", "schematron");

    /**
     * HITSP/C32 v2.4
     * HITSP/C32 v2.4 Summary Documents Using HL7 CCD (using HITSP/C83 v1.0)
     */
    public static final Ruleset C32_v2_4 = new Ruleset("hitspValidation/schematron/new/c32", "new_c32.sch", "schematron");

    /**
     * HITSP/C32 v2.1
     * HITSP/C32 v2.1 Summary Documents Using HL7 CCD
     */
    public static final Ruleset C32 = new Ruleset("hitspValidation/schematron/c32", "HITSP_C32.sch", "schematron");

    /**
     * PHMR v1.1
     * HL7 Personal Healthcare Monitoring Report Release 1.1
     */
    public static final Ruleset Phmr = new Ruleset("hitspValidation/schematron/phmr", "PHMR.sch", "schematron");

    /**
     * NHIN Summary Patient Record
     * NHIN Summary Patient Record (based on HITSP/C32)
     */
    public static final Ruleset SummaryPatientRecord = new Ruleset("hitspValidation/schematron/nhin/summaryPatientRecord", "summaryPatientRecord.sch", "schematron");

    /**
     * CDA R2 (With IHE LAB Extensions)
     * HL7 CDA R2 (With IHE LAB Extensions)
     */
    public static final Ruleset Cdar2ihelab = new Ruleset("hitspValidation/schema/cdar2ihelab/infrastructure/cda", "LabCDA.xsd", "schema");

    /**
     * CDA R2 (With HITSP Extensions)
     * HL7 CDA R2 (With HITSP Extensions)
     */
    public static final Ruleset Cdar2c32 = new Ruleset("hitspValidation/schema/cdar2c32/infrastructure/cda", "C32_CDA.xsd", "schema");

    /**
     * CDA R2 (With IHE PCC Extensions)
     * HL7 CDA R2 (With IHE PCC Extensions)
     */
    public static final Ruleset Cdar2pcc = new Ruleset("hitspValidation/schema/cdar2pcc/infrastructure/cda", "PCC_CDA.xsd", "schema");

    /**
     * CDA R2 (With IHE PCC/LAB Extensions)
     * HL7 CDA R2 (With IHE PCC/LAB Extensions)
     */
    public static final Ruleset Cdar2ihe = new Ruleset("hitspValidation/schema/cdar2ihe/infrastructure/cda", "IHE_CDA.xsd", "schema");

    /**
     * IHE Lab v4.0
     * IHE Laboratory Report -- v4.0
     */
    public static final Ruleset IheLab40 = new Ruleset("hitspValidation/schematron/ihe_lab_40", "iheLab4_0.sch", "schematron");

    /**
     * IHE Lab v3.0
     * IHE Laboratory Report -- v3.0
     */
    public static final Ruleset IheLab2011 = new Ruleset("hitspValidation/schematron/IHELab2011", "HITSP_C37.sch", "schematron");

    /**
     * IHE Lab 2008
     * IHE Laboratory Report -- 2008
     */
    public static final Ruleset IheLab = new Ruleset("hitspValidation/schematron/newLab", "HITSP_C37.sch", "schematron");

    /**
     * HITSP/C37
     * IHE Laboratory Report -- 2007
     */
    public static final Ruleset C37 = new Ruleset("hitspValidation/schematron/c37", "HITSP_C37.sch", "schematron");

    /**
     * HITSP/C28 (Nursing)
     * IHE PCC - Emergency Department Nursing Note -- 2008
     */
    public static final Ruleset C28nursing = new Ruleset("hitspValidation/schematron/c28", "edNursingNote.sch", "schematron");

    /**
     * HITSP/C28 (Physician)
     * IHE PCC - Emergency Department Physician Note -- 2008
     */
    public static final Ruleset C28physician = new Ruleset("hitspValidation/schematron/c28", "edPhysicianNote.sch", "schematron");

    /**
     * HITSP/C28 (Triage)
     * IHE PCC - Emergency Department Triage Note -- 2008
     */
    public static final Ruleset C28triage = new Ruleset("hitspValidation/schematron/c28", "edTriageNote.sch", "schematron");

    /**
     * IHE EDES Nursing Note
     * IHE PCC - Emergency Department Nursing Note -- 2012
     */
    public static final Ruleset EdNursing = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "edNursingNote.sch", "schematron");

    /**
     * IHE EDES Physician Note
     * IHE PCC - Emergency Department Physician Note -- 2012
     */
    public static final Ruleset EdPhysician = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "edPhysicianNote.sch", "schematron");

    /**
     * IHE EDES Triage Note
     * IHE PCC - Emergency Department Triage Note -- 2012
     */
    public static final Ruleset EdTriage = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "edTriageNote.sch", "schematron");

    /**
     * IHE EDES Composite Triage and Nursing Note
     * IHE PCC - Emergency Department Composite Triage and Nursing Note -- 2012
     */
    public static final Ruleset EdComposite = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "edComposite.sch", "schematron");

    /**
     * HITSP/C78 v1.1
     * HITSP/C78 Immunization Document Component
     */
    public static final Ruleset C78_1_1 = new Ruleset("hitspValidation/schematron/c78_1_1", "HITSP_C78.sch", "schematron");

    /**
     * HITSP/C78 v1.0
     * HITSP/C78 Immunization Document Component v1.0
     */
    public static final Ruleset C78 = new Ruleset("hitspValidation/schematron/c78", "HITSP_C78.sch", "schematron");

    /**
     * HITSP/C48 Referral v2.5 -- HITSP/C83 v1.1
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.5 (using HITSP/C83 v1.1) -- Referral
     */
    public static final Ruleset C48ref_2_5 = new Ruleset("hitspValidation/schematron/c48_2_5", "HITSP_C48_ref.sch", "schematron");

    /**
     * HITSP/C48 Discharge v2.5 -- HITSP/C83 v1.1
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.5 (using HITSP/C83 v1.1)-- Discharge
     */
    public static final Ruleset C48dis_2_5 = new Ruleset("hitspValidation/schematron/c48_2_5", "HITSP_C48_dis.sch", "schematron");

    /**
     * HITSP/C48 Referral v2.4
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.4 -- Referral
     */
    public static final Ruleset C48ref = new Ruleset("hitspValidation/schematron/c48", "HITSP_C48_ref.sch", "schematron");

    /**
     * HITSP/C48 Discharge v2.4
     * HITSP/C48 Encounter Document Using IHE Medical Summary (XDS-MS) Component v2.4 -- Discharge
     */
    public static final Ruleset C48dis = new Ruleset("hitspValidation/schematron/c48", "HITSP_C48_dis.sch", "schematron");

    /**
     * XDS-MS Referral Summary
     * IHE PCC - XDS-MS Referral Summary -- 2012
     */
    public static final Ruleset IheXdsMsReferral = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "xdsMsReferral.sch", "schematron");

    /**
     * XDS-MS Discharge Summary
     * IHE PCC - XDS-MS Discharge Summary -- 2012
     */
    public static final Ruleset IheXdsMsDischarge = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "xdsMsDischarge.sch", "schematron");

    /**
     * IHE ED Referral
     * IHE PCC - Emergency Department Referral -- 2012
     */
    public static final Ruleset IheEdReferral = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "edReferral.sch", "schematron");

    /**
     * IHE PHR Extract
     * IHE PCC - PHR Extract (from XPHR Profile) -- 2012
     */
    public static final Ruleset IhePhrExtract = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "xphrExtract.sch", "schematron");

    /**
     * IHE PHR Update
     * IHE PCC - PHR Update (from XPHR Profile) -- 2012
     */
    public static final Ruleset IhePhrUpdate = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "xphrUpdate.sch", "schematron");

    /**
     * IHE APS
     * IHE PCC - Antepartum Summary -- 2012
     */
    public static final Ruleset IheAps = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "aps.sch", "schematron");

    /**
     * IHE APHP
     * IHE PCC - Antepartum History and Physical -- 2012
     */
    public static final Ruleset IheAphp = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "aphp.sch", "schematron");

    /**
     * IHE APE
     * IHE PCC - Antepartum Education -- 2012
     */
    public static final Ruleset IheApe = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ape.sch", "schematron");

    /**
     * IHE IC
     * IHE PCC - Immunization Content -- 2012
     */
    public static final Ruleset IheId = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "immunizationDetail.sch", "schematron");

    /**
     * IHE CRD
     * IHE QRPH - Clinical Research Data Capture (CRD) -- CCD Option Only! -- 2010
     */
    public static final Ruleset IheCrd = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "crd.sch", "schematron");

    /**
     * IHE BPPC
     * IHE Basic Patient Privacy Concern -- 2010
     */
    public static final Ruleset IheBppc = new Ruleset("hitspValidation/schematron/ihe/bppc", "BPPC.sch", "schematron");

    /**
     * IHE MDS
     * IHE PCC - Labor and Delivery Record - Maternal Discharge Summary -- 2012
     */
    public static final Ruleset IheMds = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "mds.sch", "schematron");

    /**
     * IHE LDS
     * IHE PCC - Labor and Delivery Record - Labor and Delivery Summary -- 2012
     */
    public static final Ruleset IheLds = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "lds.sch", "schematron");

    /**
     * IHE LDHP
     * IHE PCC - Labor and Delivery Record - Labor and Delivery Admission History and Physical -- 2012
     */
    public static final Ruleset IheLdhp = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ldhp.sch", "schematron");

    /**
     * IHE ENS
     * IHE PCC - eNursing Summary -- 2012
     */
    public static final Ruleset IheEns = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ens.sch", "schematron");

    /**
     * IHE PPVS
     * IHE PCC - Postpartum Visit Summary -- 2012
     */
    public static final Ruleset IhePpvs = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ppvs.sch", "schematron");

    /**
     * IHE PPOC
     * IHE PCC - Patient Plan of Care (Care Plan Specification) -- 2012
     */
    public static final Ruleset IhePpoc = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ppoc.sch", "schematron");

    /**
     * IHE NDS
     * IHE PCC - Newborn Discharge Summary -- 2012
     */
    public static final Ruleset IheNds = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "nds.sch", "schematron");

    /**
     * IHE PRPH-CA
     * IHE QRPH - Physician Reporting to a Public Health Repository - Cancer Registry -- 2011
     */
    public static final Ruleset IhePrphca = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "prphca.sch", "schematron");

    /**
     * IHE PRPH-CA CONNECTATHON VERSION
     * IHE QRPH - Physician Reporting to a Public Health Repository - Cancer Registry -- 2011 -- Connectathon Version (includes changes from CP-QRPH-0057)
     */
    public static final Ruleset IhePrphcaConnectathon = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "prphca-connectathon.sch", "schematron");

    /**
     * IHE EHCP
     * IHE QRPH - Early Hearing Care Plan -- 2012
     */
    public static final Ruleset IheEhcp = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ehcp.sch", "schematron");

    /**
     * NHSR
     * NHSR - Newborn Hearing Screening Result
     */
    public static final Ruleset Nhsr = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "nhsr.sch", "schematron");

    /**
     * IHE LDSVR
     * IHE QRPH - Labor and Delivery Summary for Vital Records -- 2012
     */
    public static final Ruleset IheLdsVr = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "ldsvr.sch", "schematron");

    /**
     * IHE RECON
     * IHE PCC RECON - Reconciliation of Diagnoses, Allergies and Medications -- 2012
     */
    public static final Ruleset IheRecon = new Ruleset("hitspValidation/schematron/ihe_pcc_7_0", "recon.sch", "schematron");

    /**
     * HL7 QRDA Category I
     * HL7 Quality Reporting Document Architecture (QRDA) - Category I
     */
    public static final Ruleset Hl7QrdaCat1 = new Ruleset("hitspValidation/schematron/quality", "qrdaCat1.sch", "schematron");

    /**
     * HL7 QRDA BMI
     * HL7 Quality Reporting Document Architecture (QRDA) - Pediatric Body Mass Index Percentile (BMI)
     */
    public static final Ruleset Hl7QrdaBmi = new Ruleset("hitspValidation/schematron/quality", "bmi.sch", "schematron");

}