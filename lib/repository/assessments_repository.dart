import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/network/assessments_client.dart';
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
        stage2.ecebStage2AssessExam == false)
      throw Exception(AppLocalizations.of(context)!.completeAssessments);
    if (stage2.ecebFastBreathing == null ||
        stage2.ecebChestIndrawing == null ||
        stage2.ecebIsFeedingProperly == null ||
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
    }
    return assessments;
  }

  Future registerStage1Details(Stage1 stage1, String id) async {
    Profile profile = hiveStorageRepository.getProfile();

    String json = jsonEncode(stage1);
    assessmentsClient.registerEvent(
        json, id, profile.username, profile.password);
    return;
  }

  Future registerStage2Details(Stage2 stage2, String id) async {
    Profile profile = hiveStorageRepository.getProfile();

    String json = jsonEncode(stage2);
    assessmentsClient.registerEvent(
        json, id, profile.username, profile.password);
    return;
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
          result.add(Stage1.fromJson(item));
        }
        if (item['programStage'] == DHIS2Config.stage2ID &&
            item['status'] == 'COMPLETED') {
          result.add(Stage2.fromJson(item));
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
    } else {
      notificationRepository.immediateNotification(childModel.key,
          childModel.parent, AppLocalizations.of(context)!.phase2);
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
    } else {
      notificationRepository.immediateNotification(childModel.key,
          childModel.parent, AppLocalizations.of(context)!.phase2);
    }
  }
}
