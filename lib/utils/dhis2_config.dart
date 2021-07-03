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
  static const String classification = "ivo84s6Uv29";

  //Stage 0 Registering Babies
  static const String stageRegisteringBabies = "e63FeH2EwPL";
  static const String ecebWeight = "M8CLfn84QaV";
  static const String ecebSkinColorChanges = "DXdXA90lOYK";
  static const String ecebTraumasDuringBirth = "ERxsxYUAXXa";
  static const String ecebWardName = "s6l1WJeNh0q";
  static const String ecebskinColorChangesNotes = "bZ5hszY7Myn";
  static const String ecebtraumasDuringBirthNotes = "kX6x2gghjPN";

  // program Rules
  static const String programRuleNormal =
      "#{ECEB_Weight} >2000  && !#{ECEB_Severe_Jaundice} && #{ECEB_Assess_Temperature}> 35.5 && #{ECEB_Assess_Temperature} < 37.5  && !#{ECEB_Chest_Indrawing}  && !#{ECEB_Not_Feeding} && !#{ECEB_Fast_Breathing}";
  static const String programRuleProblem =
      "#{ECEB_Weight} < 2000    &&  (#{ECEB_Assess_Temperature}> 35.5 && #{ECEB_Assess_Temperature} < 37.5)  && !#{ECEB_Fast_Breathing}  && !#{ECEB_Severe_Jaundice}  && !#{ECEB_Chest_Indrawing}  && !#{ECEB_Not_Feeding}";
  static const String programRuleDanger =
      "#{ECEB_Severe_Jaundice} || #{ECEB_Assess_Temperature}<= 35.5 || #{ECEB_Assess_Temperature} >= 37.5  || #{ECEB_Weight} < 1500 || #{ECEB_Chest_Indrawing} ||#{ECEB_Not_Feeding} || #{ECEB_Fast_Breathing} || #{ECEB_Convulsions}";

  //Stage - 1 Assessments
  static const String eceb_Stage_1_Initiate_Breastfeeding = "M8CLfn84QaV";
  static const String eceb_Stage_1_Monitor_Breathing = "IxfeTQ4ne9C";
  static const String eceb_Stage_1_Skin_To_Skin_Care = "RDncZ0AGIEQ";

  //Stage - 2 Assessments
  static const String ecebCurrentLocation = "bPfXwTgGdkI";
  static const String ecebAssessTemperature = "zZpNiKcIMHA";
  static const String ecebSevereJaundice = "oIpUd9Up3CX";
  static const String ecebFastBreathing = "IDe2vwLt3EB";
  static const String ecebChestIndrawing = "HcG32VrK3Um";
  static const String ecebNotFeeding = "VD9JO6bY2o1";
  static const String ecebConvulsions = "VqJL6KvxrKT";
  static const String eceb_Stage_2_Assess_Exam = "Ya3AmFV6Yu9";
  static const String eceb_Stage_2_Prevent_Disease_VitaminK = "XfdHyjVbRWo";
  static const String eceb_Stage_2_Prevent_Disease_Cord_Care = "VsKyN9x1hZk";
  static const String eceb_Stage_2_Prevent_Disease_Eye_Care = "y80qB17Dv8b";

  //Stage - 3 Assessments Normal
  static const String eceb_Stage_3_Normal_Maintain_Normal_Temperature =
      "gF9Jgs3BYud";
  static const String eceb_Stage_3_Normal_Support_Breastfeeding = "zu7IjXzfoul";
  static const String eceb_Stage_3_Normal_Advise_About_Breast_Feeding_Problems =
      "PH2GfTJAdUx";
  static const String eceb_Stage_3_Normal_Immunize = "Pc6UmgYQUEF";

  //Stage - 3 Assessments Problem
  static const String
      eceb_Stage_3_Problem_Under_2000g_Prolong_skin_to_skin_care =
      "maGPaup2xXT";
  static const String
      eceb_Stage_3_Problem_Abnormal_Temperature_Improve_Thermal_Care =
      "RCV6TgQyYhD";
  static const String eceb_Stage_3_Problem_Continue_Inpatient_Care =
      "KxDE46h1ERH";
  static const String eceb_Stage_3_Problem_Poor_Feeding_Express_Breast_Milk =
      "j5j0FVVMiBZ";
  static const String
      eceb_Stage_3_Problem_Poor_Feeding_Use_Alternative_Feeding_Method =
      "IYAaEwlnfOm";

  //Stage - 3 Assessments Danger
  static const String eceb_Stage_3_Give_Antibiotics = "JLSf9WjMeKR";
  static const String eceb_Stage_3_Seek_Advanced_Care = "cdFkGwVUKhK";

  //Stage - 5 Discharge
  static const String eceb_Stage_5_Normal_Reassess_baby_for_discharge =
      "CW6Uob7rOVY";
  static const String eceb_Stage_5_Normal_Give_parents_guidance_for_home_care =
      "IAhrpxprLlq";
}
