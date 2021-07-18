import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
part 'auto_generate/stage_3_normal.g.dart';

@HiveType(typeId: 9)
class Stage3Normal {
  @HiveField(0)
  bool ecebStage3NormalMaintainNormalTemperature = false;
  @HiveField(1)
  bool ecebStage3NormalSupportBreastfeeding = false;
  @HiveField(2)
  bool ecebStage3NormalAdviseAboutBreastFeedingProblems = false;
  @HiveField(3)
  bool ecebStage3NormalImmunize = false;
  @HiveField(4)
  bool isCompleted = false;
  Stage3Normal();
  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage3IDNormal,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {
            "dataElement":
                DHIS2Config.ecebStage3NormalMaintainNormalTemperature,
            "value": ecebStage3NormalMaintainNormalTemperature
          },
          {
            "dataElement": DHIS2Config.ecebStage3NormalSupportBreastfeeding,
            "value": ecebStage3NormalSupportBreastfeeding
          },
          {
            "dataElement":
                DHIS2Config.ecebStage3NormalAdviseAboutBreastFeedingProblems,
            "value": ecebStage3NormalAdviseAboutBreastFeedingProblems
          },
          {
            "dataElement": DHIS2Config.ecebStage3NormalImmunize,
            "value": ecebStage3NormalImmunize
          }
        ]
      };

  Stage3Normal.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.ecebStage3NormalMaintainNormalTemperature:
          ecebStage3NormalMaintainNormalTemperature =
              element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3NormalSupportBreastfeeding:
          ecebStage3NormalSupportBreastfeeding = element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3NormalAdviseAboutBreastFeedingProblems:
          ecebStage3NormalAdviseAboutBreastFeedingProblems =
              element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3NormalImmunize:
          ecebStage3NormalImmunize = element['value'] == 'true';
          break;
      }
    });
  }
}
