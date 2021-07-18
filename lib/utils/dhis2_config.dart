class DHIS2Config {
  static const String serverURL = "https://bmgfdev.soic.iupui.edu";
  static const String programECEBID = "gC4kB3ulSJl";
  static const String orgUnit = "yvWZnR3olFA";

  //Tracked Entity Instance
  static const String trackedEntity = "gBy25NmwMRc";
  static const String ecebMotherName = "Q5el38rO0bG";
  static const String ecebGender = "wJU7PfVaK3U";
  static const String ecebBabiesDelivered = "IVNp5un0dGa";
  static const String ecebBirthDateTime = "ZEi7UfVy21n";
  static const String ecebModeOfDelivery = "JH16XsPOvJr";
  static const String teiWardname = "HKmbmXfiDJB";
  static const String ecebTeiClassification = "ivo84s6Uv29";

  //Stage 0 Registering Babies
  static const String stage0ID = "e63FeH2EwPL";
  static const String stageRegisteringBabies = "e63FeH2EwPL";
  static const String ecebWeight = "M8CLfn84QaV";
  static const String ecebSkinColorChanges = "DXdXA90lOYK";
  static const String ecebTraumasDuringBirth = "ERxsxYUAXXa";
  static const String ecebWardName = "s6l1WJeNh0q";
  static const String ecebskinColorChangesNotes = "bZ5hszY7Myn";
  static const String ecebtraumasDuringBirthNotes = "kX6x2gghjPN";

  // program Rules
  static String programRuleNormal =
      "#{ecebWeight} >2000  && !#{ecebSevereJaundice} && #{ecebAssessTemperature}> 95.5 && #{ecebAssessTemperature} < 99.5  && !#{ecebChestIndrawing}  && !#{ecebFeedingProperly} && !#{ecebFastBreathing}";
  static String programRuleProblem =
      "#{ecebWeight} < 2000    &&  (#{ecebAssessTemperature}> 95.5 && #{ecebAssessTemperature} < 99.5)  && !#{ecebFastBreathing}  && !#{ecebSevereJaundice}  && !#{ecebChestIndrawing}  && !#{ecebFeedingProperly}";
  static String programRuleDanger =
      "#{ecebSevereJaundice} ||#{ecebAssessTemperature}<= 95.9 || #{ecebAssessTemperature} >= 99.5  || #{ecebWeight} < 1500 || #{ecebChestIndrawing} || !#{ecebFeedingProperly} || #{ecebFastBreathing} || #{ecebConvulsions}";

  static setUpProgramRules() {
    programRuleNormal = programRuleNormal.replaceAll('#', '');
    programRuleProblem = programRuleProblem.replaceAll('#', '');
    programRuleDanger = programRuleDanger.replaceAll('#', '');
  }

  //Stage - 1 Assessments
  static const String stage1ID = "URydNJS8i3T";
  static const String eceb_Stage_1_Initiate_Breastfeeding = "Ya3AmFV6Yu9";
  static const String eceb_Stage_1_Monitor_Breathing = "IxfeTQ4ne9C";
  static const String eceb_Stage_1_Skin_To_Skin_Care = "RDncZ0AGIEQ";

  //Stage - 2 Assessments
  static const String stage2ID = "neIkFKr6xO4";
  static const String ecebAssessTemperature = "zZpNiKcIMHA";
  static const String ecebSevereJaundice = "oIpUd9Up3CX";
  static const String ecebFastBreathing = "IDe2vwLt3EB";
  static const String ecebChestIndrawing = "HcG32VrK3Um";
  static const String ecebIsFeedingProperly = "VD9JO6bY2o1";
  static const String ecebConvulsions = "VqJL6KvxrKT";
  static const String ecebExaminationHead = "jmPjlhUBtrD";
  static const String ecebExaminationGenitalia = "d3jPHB6EGrA";
  static const String ecebExaminationEyes = "glTBt2kk82C";
  static const String ecebExaminationAnus = "Ko9E05aZlwN";
  static const String ecebExaminationEarsNoseThroat = "DPQ5oPje1qs";
  static const String ecebExaminationMuscoskeletal = "iwUAQFG2r1Y";
  static const String ecebExaminationChest = "bDioHeuWrdS";
  static const String ecebExaminationNeurology = "sktpcovPufD";
  static const String ecebExaminationCardiovascular = "BzmzxKxssnM";
  static const String ecebExaminationSkin = "Y6XSPZdgcyD";
  static const String ecebExaminationAbdomen = "BYSHk05PoEo";
  static const String ecebExaminationOverall = "GMDi3xPJZNr";
  static const String ecebStage2PreventDiseaseVitaminK = "XfdHyjVbRWo";
  static const String ecebStage2PreventDiseaseCordCare = "VsKyN9x1hZk";
  static const String ecebStage2PreventDiseaseEyeCare = "y80qB17Dv8b";

  //Stage - 3 Assessments Normal
  static const String ecebStage3NormalMaintainNormalTemperature =
      "gF9Jgs3BYud";
  static const String ecebStage3NormalSupportBreastfeeding = "zu7IjXzfoul";
  static const String ecebStage3NormalAdviseAboutBreastFeedingProblems =
      "PH2GfTJAdUx";
  static const String ecebStage3NormalImmunize = "Pc6UmgYQUEF";

  //Stage - 3 Assessments Problem
  static const String
      ecebStage3ProblemUnder2000gProlongSkinToSkinCare =
      "maGPaup2xXT";
  static const String
      ecebStage3ProblemAbnormalTemperatureImproveThermalCare =
      "RCV6TgQyYhD";
  static const String ecebStage3ProblemContinueInpatientCare =
      "KxDE46h1ERH";
  static const String ecebStage3ProblemPoorFeedingExpressBreastMilk =
      "j5j0FVVMiBZ";
  static const String
      ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod =
      "IYAaEwlnfOm";

  //Stage - 3 Assessments Danger
  static const String ecebStage3GiveAntibiotics = "JLSf9WjMeKR";
  static const String ecebStage3SeekAdvancedCare = "cdFkGwVUKhK";

  //Stage - 5 Discharge
  static const String eceb_Stage_5_Normal_Reassess_baby_for_discharge =
      "CW6Uob7rOVY";
  static const String eceb_Stage_5_Normal_Give_parents_guidance_for_home_care =
      "IAhrpxprLlq";
}
