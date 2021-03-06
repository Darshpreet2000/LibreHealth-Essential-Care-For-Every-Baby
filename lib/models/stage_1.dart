import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

part 'auto_generate/stage_1.g.dart';

@HiveType(typeId: 6)
class Stage1 {
  @HiveField(0)
  bool? ecebStage1InitiateBreastfeeding;
  @HiveField(1)
  bool? ecebStage1MonitorBreathing;
  @HiveField(2)
  bool? ecebStage1SkinToSkinCare;
  @HiveField(3)
  String ecebWardName = "";
  @HiveField(4)
  bool isCompleted = false;

  Stage1() {
    ecebStage1InitiateBreastfeeding = false;
    ecebStage1MonitorBreathing = false;
    ecebStage1SkinToSkinCare = false;
  }

  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage1ID,
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
            "dataElement": DHIS2Config.eceb_Stage_1_Skin_To_Skin_Care,
            "value": ecebStage1SkinToSkinCare
          }
        ]
      };

  Stage1.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.eceb_Stage_1_Initiate_Breastfeeding:
          ecebStage1InitiateBreastfeeding = element['value'] == 'true';
          break;
        case DHIS2Config.eceb_Stage_1_Monitor_Breathing:
          ecebStage1MonitorBreathing = element['value'] == 'true';
          break;
        case DHIS2Config.eceb_Stage_1_Skin_To_Skin_Care:
          ecebStage1SkinToSkinCare = (element['value']) == 'true';
          break;
        case DHIS2Config.ecebWardName:
          ecebWardName = element['value'];
          break;
      }
    });
  }
}
