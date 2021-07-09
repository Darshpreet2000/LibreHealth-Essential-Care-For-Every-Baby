import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

part 'auto_generate/stage_2.g.dart';

@HiveType(typeId: 8)
class Stage2 {
  @HiveField(0)
  String ecebWardName = "";
  @HiveField(1)
  bool ecebStage2PreventDiseaseVitaminK = false;
  @HiveField(2)
  bool ecebStage2PreventDiseaseCordCare = false;
  @HiveField(3)
  bool ecebStage2PreventDiseaseEyeCare = false;
  @HiveField(4)
  double ecebWeight = 1000;
  @HiveField(5)
  double ecebAssessTemperature = 94;
  @HiveField(6)
  bool? ecebStage2AssessExam = false;
  @HiveField(7)
  bool? ecebFastBreathing;
  @HiveField(8)
  bool? ecebChestIndrawing;
  @HiveField(9)
  bool? ecebIsFeedingProperly;
  @HiveField(10)
  bool? ecebConvulsions;
  @HiveField(11)
  bool? ecebSevereJaundice;
  @HiveField(12)
  bool isCompleted = false;
  Stage2();

  Map<String, dynamic> toJson() => {
        "program": DHIS2Config.programECEBID,
        "orgUnit": DHIS2Config.orgUnit,
        "trackedEntityInstance": DHIS2Config.trackedEntity,
        "programStage": DHIS2Config.stage2ID,
        "eventDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "status": "COMPLETED",
        "completedDate": DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
        "dataValues": [
          {"dataElement": DHIS2Config.ecebWardName, "value": ecebWardName},
          {
            "dataElement": DHIS2Config.ecebStage2PreventDiseaseVitaminK,
            "value": ecebStage2PreventDiseaseVitaminK
          },
          {
            "dataElement": DHIS2Config.ecebStage2PreventDiseaseCordCare,
            "value": ecebStage2PreventDiseaseCordCare
          },
          {
            "dataElement": DHIS2Config.ecebStage2PreventDiseaseEyeCare,
            "value": ecebStage2PreventDiseaseEyeCare
          },
          {"dataElement": DHIS2Config.ecebWeight, "value": ecebWeight},
          {
            "dataElement": DHIS2Config.ecebAssessTemperature,
            "value": ecebAssessTemperature
          },
          {
            "dataElement": DHIS2Config.ecebStage2AssessExam,
            "value": ecebStage2AssessExam
          },
          {
            "dataElement": DHIS2Config.ecebFastBreathing,
            "value": ecebFastBreathing
          },
          {
            "dataElement": DHIS2Config.ecebChestIndrawing,
            "value": ecebChestIndrawing
          },
          {
            "dataElement": DHIS2Config.ecebIsFeedingProperly,
            "value": ecebIsFeedingProperly
          },
          {
            "dataElement": DHIS2Config.ecebConvulsions,
            "value": ecebConvulsions
          },
          {
            "dataElement": DHIS2Config.ecebSevereJaundice,
            "value": ecebSevereJaundice
          },
        ]
      };

  Stage2.fromJson(dynamic json) {
    var jsonList = json['dataValues'];
    isCompleted = true;
    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.ecebStage2PreventDiseaseVitaminK:
          ecebStage2PreventDiseaseVitaminK = element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage2PreventDiseaseCordCare:
          ecebStage2PreventDiseaseCordCare = element['value'] == 'true';
          break;
        case DHIS2Config.ecebStage2PreventDiseaseEyeCare:
          ecebStage2PreventDiseaseEyeCare = (element['value']) == 'true';
          break;
        case DHIS2Config.ecebWardName:
          ecebWardName = element['value'];
          break;
        case DHIS2Config.ecebWeight:
          ecebWeight = element['value'];
          break;
        case DHIS2Config.ecebAssessTemperature:
          ecebAssessTemperature = element['value'];
          break;
        case DHIS2Config.ecebStage2AssessExam:
          ecebStage2AssessExam = element['value'];
          break;
        case DHIS2Config.ecebFastBreathing:
          ecebFastBreathing = element['value'];
          break;
        case DHIS2Config.ecebChestIndrawing:
          ecebChestIndrawing = element['value'];
          break;
        case DHIS2Config.ecebIsFeedingProperly:
          ecebIsFeedingProperly = element['value'];
          break;
        case DHIS2Config.ecebChestIndrawing:
          ecebChestIndrawing = element['value'];
          break;
        case DHIS2Config.ecebConvulsions:
          ecebConvulsions = element['value'];
          break;
        case DHIS2Config.ecebSevereJaundice:
          ecebSevereJaundice = element['value'];
          break;
      }
    });
  }
}
