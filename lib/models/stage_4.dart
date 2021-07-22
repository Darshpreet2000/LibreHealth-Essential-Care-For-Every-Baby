import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

part 'auto_generate/stage_4.g.dart';

@HiveType(typeId: 12)
class Stage4 {
  @HiveField(0)
  double ecebWeight = 1000;
  @HiveField(1)
  double ecebAssessTemperature = 94;
  @HiveField(2)
  bool? ecebFastBreathing;
  @HiveField(3)
  bool? ecebFeedingProperly;
  @HiveField(4)
  bool? ecebSevereJaundice;
  @HiveField(5)
  bool? ecebChestIndrawing;
  @HiveField(6)
  bool? ecebConvulsions;
  @HiveField(7)
  bool isCompleted = false;
  Stage4();

  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage4ID,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {"dataElement": DHIS2Config.ecebWeight, "value": ecebWeight},
          {
            "dataElement": DHIS2Config.ecebAssessTemperature,
            "value": ecebAssessTemperature
          },
          {
            "dataElement": DHIS2Config.ecebFastBreathing,
            "value": ecebFastBreathing
          },
          {
            "dataElement": DHIS2Config.ecebIsFeedingProperly,
            "value": ecebFeedingProperly
          },
          {
            "dataElement": DHIS2Config.ecebSevereJaundice,
            "value": ecebSevereJaundice
          },
          {
            "dataElement": DHIS2Config.ecebConvulsions,
            "value": ecebConvulsions
          },
          {
            "dataElement": DHIS2Config.ecebChestIndrawing,
            "value": ecebChestIndrawing
          },
        ]
      };

  Stage4.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.ecebWeight:
          ecebWeight = double.parse(element['value']);
          break;
        case DHIS2Config.ecebAssessTemperature:
          ecebAssessTemperature = double.parse(element['value']);
          break;

        case DHIS2Config.ecebFastBreathing:
          ecebFastBreathing = element['value'] == 'true';
          break;

        case DHIS2Config.ecebIsFeedingProperly:
          ecebFeedingProperly = element['value'] == 'true';
          break;

        case DHIS2Config.ecebSevereJaundice:
          ecebSevereJaundice = element['value'] == 'true';
          break;
        case DHIS2Config.ecebConvulsions:
          ecebConvulsions = element['value'] == 'true';
          break;
        case DHIS2Config.ecebChestIndrawing:
          ecebChestIndrawing = element['value'] == 'true';
          break;
      }
    });
  }
}
