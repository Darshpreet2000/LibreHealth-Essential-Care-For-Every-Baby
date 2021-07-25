import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

part 'auto_generate/stage_5.g.dart';

@HiveType(typeId: 13)
class Stage5 {
  @HiveField(0)
  String? ecebStage5NormalReassessBabyfordischarge;
  @HiveField(1)
  String? ecebStage5NormalGiveparentsguidanceforhomecare;
  @HiveField(2)
  bool isCompleted = false;
  Stage5();

  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage5ID,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {"dataElement": DHIS2Config.ecebStage5NormalReassessBabyfordischarge, "value": ecebStage5NormalReassessBabyfordischarge},
          {
            "dataElement": DHIS2Config.ecebStage5NormalGiveparentsguidanceforhomecare,
            "value": ecebStage5NormalGiveparentsguidanceforhomecare
          },
        ]
      };

  Stage5.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.ecebStage5NormalReassessBabyfordischarge:
          ecebStage5NormalReassessBabyfordischarge = (element['value']);
          break;
        case DHIS2Config.ecebStage5NormalGiveparentsguidanceforhomecare:
          ecebStage5NormalGiveparentsguidanceforhomecare = (element['value']);
          break;
      }
    });
  }
}
