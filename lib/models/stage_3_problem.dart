import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
part 'auto_generate/stage_3_problem.g.dart';

@HiveType(typeId: 10)
class Stage3Problem {
  @HiveField(0)
  bool ecebStage3ProblemUnder2000gProlongSkinToSkinCare = false;
  @HiveField(1)
  bool ecebStage3ProblemAbnormalTemperatureImproveThermalCare = false;
  @HiveField(2)
  bool ecebStage3ProblemContinueInpatientCare = false;
  @HiveField(3)
  bool ecebStage3ProblemPoorFeedingExpressBreastMilk = false;
  @HiveField(4)
  bool ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod = false;
  @HiveField(5)
  bool isCompleted = false;
  Stage3Problem();
  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage3IDProblem,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {
            "dataElement":
                DHIS2Config.ecebStage3ProblemUnder2000gProlongSkinToSkinCare,
            "value": ecebStage3ProblemUnder2000gProlongSkinToSkinCare
          },
          {
            "dataElement": DHIS2Config
                .ecebStage3ProblemAbnormalTemperatureImproveThermalCare,
            "value": ecebStage3ProblemAbnormalTemperatureImproveThermalCare
          },
          {
            "dataElement": DHIS2Config.ecebStage3ProblemContinueInpatientCare,
            "value": ecebStage3ProblemContinueInpatientCare
          },
          {
            "dataElement":
                DHIS2Config.ecebStage3ProblemPoorFeedingExpressBreastMilk,
            "value": ecebStage3ProblemPoorFeedingExpressBreastMilk
          },
          {
            "dataElement": DHIS2Config
                .ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod,
            "value": ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod
          }
        ]
      };

  Stage3Problem.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.ecebStage3ProblemUnder2000gProlongSkinToSkinCare:
          ecebStage3ProblemUnder2000gProlongSkinToSkinCare =
              element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3ProblemAbnormalTemperatureImproveThermalCare:
          ecebStage3ProblemAbnormalTemperatureImproveThermalCare =
              element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3ProblemContinueInpatientCare:
          ecebStage3ProblemContinueInpatientCare = element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage3ProblemPoorFeedingExpressBreastMilk:
          ecebStage3ProblemPoorFeedingExpressBreastMilk =
              element['value'] == 'true';
          break;
        case DHIS2Config
            .ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod:
          ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod =
              element['value'] == 'true';
          break;
      }
    });
  }
}
