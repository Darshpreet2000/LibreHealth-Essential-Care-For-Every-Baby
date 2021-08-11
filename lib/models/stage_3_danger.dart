import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
part 'auto_generate/stage_3_danger.g.dart';

@HiveType(typeId: 11)
class Stage3Danger {
  @HiveField(0)
  bool ecebStage3GiveAntibiotics = false;
  @HiveField(1)
  bool ecebStage3SeekAdvancedCare = false;
  @HiveField(2)
  bool isCompleted = false;
  Stage3Danger();
  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage3IDDanger,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {
            "dataElement": DHIS2Config.ecebStage3GiveAntibiotics,
            "value": ecebStage3GiveAntibiotics
          },
          {
            "dataElement": DHIS2Config.ecebStage3SeekAdvancedCare,
            "value": ecebStage3SeekAdvancedCare
          },
        ]
      };

  Stage3Danger.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.ecebStage3GiveAntibiotics:
          ecebStage3GiveAntibiotics = element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3SeekAdvancedCare:
          ecebStage3SeekAdvancedCare = element['value'] == 'true';
          break;
      }
    });
  }
}
