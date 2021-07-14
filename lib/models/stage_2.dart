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
  bool ecebExaminationHead = false;
  @HiveField(7)
  bool ecebExaminationGenitalia = false;
  @HiveField(8)
  bool ecebExaminationEyes = false;
  @HiveField(9)
  bool ecebExaminationAnus = false;
  @HiveField(10)
  bool ecebExaminationEarsNoseThroat = false;
  @HiveField(11)
  bool ecebExaminationMuscoskeletal = false;
  @HiveField(12)
  bool ecebExaminationChest = false;
  @HiveField(13)
  bool ecebExaminationNeurology = false;
  @HiveField(14)
  bool ecebExaminationCardiovascular = false;
  @HiveField(15)
  bool ecebExaminationSkin = false;
  @HiveField(16)
  bool ecebExaminationAbdomen = false;
  @HiveField(17)
  bool ecebExaminationOverall = false;
  @HiveField(18)
  bool? ecebFastBreathing;
  @HiveField(19)
  bool? ecebChestIndrawing;
  @HiveField(20)
  bool? ecebFeedingProperly;
  @HiveField(21)
  bool? ecebConvulsions;
  @HiveField(22)
  bool? ecebSevereJaundice;
  @HiveField(23)
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
            "dataElement": DHIS2Config.ecebExaminationHead,
            "value": ecebExaminationHead
          },
          {
            "dataElement": DHIS2Config.ecebExaminationGenitalia,
            "value": ecebExaminationGenitalia
          },
          {
            "dataElement": DHIS2Config.ecebExaminationEyes,
            "value": ecebExaminationEyes
          },
          {
            "dataElement": DHIS2Config.ecebExaminationAnus,
            "value": ecebExaminationAnus
          },
          {
            "dataElement": DHIS2Config.ecebExaminationEarsNoseThroat,
            "value": ecebExaminationEarsNoseThroat
          },
          {
            "dataElement": DHIS2Config.ecebExaminationMuscoskeletal,
            "value": ecebExaminationMuscoskeletal
          },
          {
            "dataElement": DHIS2Config.ecebExaminationChest,
            "value": ecebExaminationChest
          },
          {
            "dataElement": DHIS2Config.ecebExaminationNeurology,
            "value": ecebExaminationNeurology
          },
          {
            "dataElement": DHIS2Config.ecebExaminationCardiovascular,
            "value": ecebExaminationCardiovascular
          },
          {
            "dataElement": DHIS2Config.ecebExaminationSkin,
            "value": ecebExaminationSkin
          },
          {
            "dataElement": DHIS2Config.ecebExaminationAbdomen,
            "value": ecebExaminationAbdomen
          },
          {
            "dataElement": DHIS2Config.ecebExaminationOverall,
            "value": ecebExaminationOverall
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
            "value": ecebFeedingProperly
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
          ecebWeight = double.parse(element['value']);
          break;
        case DHIS2Config.ecebAssessTemperature:
          ecebAssessTemperature = double.parse(element['value']);
          break;

        case DHIS2Config.ecebExaminationHead:
          ecebExaminationHead = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationGenitalia:
          ecebExaminationGenitalia = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationEyes:
          ecebExaminationEyes = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationAnus:
          ecebExaminationAnus = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationEarsNoseThroat:
          ecebExaminationEarsNoseThroat = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationMuscoskeletal:
          ecebExaminationMuscoskeletal = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationChest:
          ecebExaminationChest = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationNeurology:
          ecebExaminationNeurology = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationCardiovascular:
          ecebExaminationCardiovascular = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationSkin:
          ecebExaminationSkin = element['value'] == 'true';
          break;
        case DHIS2Config.ecebExaminationAbdomen:
          ecebExaminationAbdomen = element['value'] == 'true';
          break;

        case DHIS2Config.ecebExaminationOverall:
          ecebExaminationOverall = element['value'] == 'true';
          break;

        case DHIS2Config.ecebFastBreathing:
          ecebFastBreathing = element['value'] == 'true';
          break;
        case DHIS2Config.ecebChestIndrawing:
          ecebChestIndrawing = element['value'] == 'true';
          break;
        case DHIS2Config.ecebIsFeedingProperly:
          ecebFeedingProperly = element['value'] == 'true';
          break;
        case DHIS2Config.ecebChestIndrawing:
          ecebChestIndrawing = element['value'] == 'true';
          break;
        case DHIS2Config.ecebConvulsions:
          ecebConvulsions = element['value'] == 'true';
          break;
        case DHIS2Config.ecebSevereJaundice:
          ecebSevereJaundice = element['value'] == 'true';
          break;
      }
    });
  }
}
