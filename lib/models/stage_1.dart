import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

class Stage1 {
  final bool ecebStage1InitiateBreastfeeding;
  final bool ecebStage1MonitorBreathing;
  final bool ecebStage1SkinToSkinCare;
  final String ecebWardName;

  Stage1(this.ecebStage1InitiateBreastfeeding, this.ecebStage1MonitorBreathing,
      this.ecebStage1SkinToSkinCare, this.ecebWardName);

  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {"dataElement": DHIS2Config.ecebWardName, "value": ecebWardName},
          {
            "dataElement": DHIS2Config.eceb_Stage_1_Initiate_Breastfeeding,
            "value": ecebStage1InitiateBreastfeeding
          },
          {
            "dataElement": DHIS2Config.eceb_Stage_1_Monitor_Breathing,
            "value": ecebStage1MonitorBreathing
          },
          {
            "dataElement": DHIS2Config.eceb_Stage_1_Initiate_Breastfeeding,
            "value": ecebStage1InitiateBreastfeeding
          }
        ]
      };
}
