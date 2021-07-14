import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/network/assessments_client.dart';
import 'package:newborn_care/repository/classification_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:synchronized/synchronized.dart';

class AssessmentsRepository {
  final BuildContext context;
  final Lock lock;
  final HiveStorageRepository hiveStorageRepository;
  final RefreshRepository refreshRepository;
  late AssessmentsClient assessmentsClient;
  final NotificationRepository notificationRepository;
  AssessmentsRepository(this.context, this.lock, this.hiveStorageRepository,
      this.refreshRepository, this.notificationRepository) {
    assessmentsClient = new AssessmentsClient(
        http.Client(), context, lock, hiveStorageRepository, refreshRepository);
  }
  AssessmentsRepository.test(
      this.context,
      this.lock,
      this.hiveStorageRepository,
      this.refreshRepository,
      this.assessmentsClient,
      this.notificationRepository);

  void validatePhase1Assessments(Stage1 stage1) {
    if (stage1.ecebWardName.isEmpty)
      throw Exception(AppLocalizations.of(context)!.enterWardName);

    if (stage1.ecebStage1InitiateBreastfeeding == false ||
        stage1.ecebStage1MonitorBreathing == false ||
        stage1.ecebStage1SkinToSkinCare == false)
      throw Exception(AppLocalizations.of(context)!.completeAssessments);

    //marking stage as completed
    stage1.isCompleted = true;
    return;
  }

  void validatePhase2Assessments(Stage2 stage2, DateTime birthTime) {
    //check if 60 minutes from birth has passed
    if (DateTime.now().difference(birthTime).inMinutes < 60) {
      throw Exception(AppLocalizations.of(context)!
          .phase2AssessmentsToBeDoneOnlyAfter60MinutesFromBirth);
    }
    if (stage2.ecebWardName.isEmpty)
      throw Exception(AppLocalizations.of(context)!.enterWardName);
    if (stage2.ecebStage2PreventDiseaseVitaminK == false ||
        stage2.ecebStage2PreventDiseaseCordCare == false ||
        stage2.ecebStage2PreventDiseaseEyeCare == false ||
        stage2.ecebExaminationHead == false ||
        stage2.ecebExaminationGenitalia == false ||
        stage2.ecebExaminationEyes == false ||
        stage2.ecebExaminationAnus == false ||
        stage2.ecebExaminationEarsNoseThroat == false ||
        stage2.ecebExaminationMuscoskeletal == false ||
        stage2.ecebExaminationChest == false ||
        stage2.ecebExaminationCardiovascular == false ||
        stage2.ecebExaminationSkin == false ||
        stage2.ecebExaminationAbdomen == false ||
        stage2.ecebExaminationOverall == false)
      throw Exception(AppLocalizations.of(context)!.completeAssessments);
    if (stage2.ecebFastBreathing == null ||
        stage2.ecebChestIndrawing == null ||
        stage2.ecebFeedingProperly == null ||
        stage2.ecebConvulsions == null ||
        stage2.ecebSevereJaundice == null)
      throw Exception(AppLocalizations.of(context)!.completeAssessments);

    //marking stage as completed
    stage2.isCompleted = true;
    return;
  }

  List<Object> addNextAssessment(ChildModel childModel) {
    List<Object> assessments = childModel.assessmentsList;
    if (assessments.length == 0) {
      assessments.add(Stage1());
      addStage1Notifications(childModel);
    } else if (assessments.length == 1) {
      assessments.add(Stage2());
      addStage2Notifications(childModel);
    } else if (assessments.length == 2) {}
    return assessments;
  }

  void changeColorBasedOnClassification(ChildModel childModel) {
    if (childModel.classification == AppLocalizations.of(context)!.normal) {
      childModel.color = Colors.green[100]!.value;
      childModel.darkColor = Colors.green[300]!.value;
    } else if (childModel.classification ==
        AppLocalizations.of(context)!.problem) {
      childModel.color = Colors.yellow[100]!.value;
      childModel.darkColor = Colors.yellow[300]!.value;
    } else if (childModel.classification ==
        AppLocalizations.of(context)!.danger) {
      childModel.color = Colors.red[100]!.value;
      childModel.darkColor = Colors.red[300]!.value;
    } else {
      childModel.color = Colors.blue[50]!.value;
      childModel.darkColor = Colors.white.value;
    }
  }

  Future registerStage1Details(Stage1 stage1, String id) async {
    Profile profile = hiveStorageRepository.getProfile();

    String json = jsonEncode(stage1);
    assessmentsClient.registerEvent(
        json, id, profile.username, profile.password);
    return;
  }

  String classifyHealthAfterStage2(Stage2 stage2) {
    return ClassificationRepository(context).classifyBabyHealth(
        ecebSevereJaundice: stage2.ecebSevereJaundice,
        ecebAssessTemperature: stage2.ecebAssessTemperature,
        ecebWeight: stage2.ecebWeight,
        ecebChestIndrawing: stage2.ecebChestIndrawing,
        ecebFeedingProperly: stage2.ecebFeedingProperly,
        ecebFastBreathing: stage2.ecebFastBreathing,
        ecebConvulsions: stage2.ecebConvulsions);
  }

  Future registerStage2Details(Stage2 stage2, String id) async {
    Profile profile = hiveStorageRepository.getProfile();

    String json = jsonEncode(stage2);
    assessmentsClient.registerEvent(
        json, id, profile.username, profile.password);
    return;
  }

  Future updateTrackedEntityInstance(
      ChildModel childModel, String id, String wardName) async {
    Profile profile = hiveStorageRepository.getProfile();
    childModel.ward = wardName;

    String json = jsonEncode(childModel.childModeltoJson(context));
    assessmentsClient.updateTrackedEntity(
        json, id, profile.username, profile.password);
  }

  Future fetchAssessments(String key) async {
    Profile profile = hiveStorageRepository.getProfile();
    try {
      Map<String, dynamic> response = jsonDecode(await assessmentsClient
          .getAssessmentsOfChild(key, profile.username, profile.password));
      List<Object> result = [];
      for (var item in response['events']) {
        if (item['programStage'] == DHIS2Config.stage1ID &&
            item['status'] == 'COMPLETED') {
          result.insert(0, Stage1.fromJson(item));
        }
        if (item['programStage'] == DHIS2Config.stage2ID &&
            item['status'] == 'COMPLETED') {
          result.insert(0, Stage2.fromJson(item));
        }
      }
      return result;
    } catch (e) {
      throw e;
    }
  }

  void addStage1Notifications(ChildModel childModel) {
    int minutesPassed =
        DateTime.now().difference(childModel.birthTime).inMinutes;
    if (minutesPassed < 60) {
      notificationRepository.immediateNotification(childModel.key,
          childModel.parent, AppLocalizations.of(context)!.phase2);

      notificationRepository.scheduledStageNotificationReminder(
          childModel.key,
          childModel.parent,
          AppLocalizations.of(context)!.phase2,
          childModel.birthTime.add(Duration(minutes: 60)));
    }
  }

  void addStage2Notifications(ChildModel childModel) {
    int minutesPassed =
        DateTime.now().difference(childModel.birthTime).inMinutes;
    if (minutesPassed < 90) {
      notificationRepository.scheduledStageNotification(
          childModel.key,
          childModel.parent,
          AppLocalizations.of(context)!.phase2,
          childModel.birthTime.add(Duration(minutes: 60)));
      notificationRepository.scheduledStageNotificationReminder(
          childModel.key,
          childModel.parent,
          AppLocalizations.of(context)!.phase2,
          childModel.birthTime.add(Duration(minutes: 90)));
    }
  }
}
