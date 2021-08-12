import 'package:flutter/cupertino.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/notification_model.dart';
import 'package:newborn_care/models/stage_3_danger.dart';
import 'package:newborn_care/models/stage_3_problem.dart';
import 'package:newborn_care/models/stage_4.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreenRepository {
  BuildContext context;
  HiveStorageRepository hiveStorageRepository;
  NotificationScreenRepository(this.context, this.hiveStorageRepository);

  List<NotificationModel> fetchRiskAssessmentsList() {
    String normal = AppLocalizations.of(context)!.normal;
    String problem = AppLocalizations.of(context)!.problem;
    String danger = AppLocalizations.of(context)!.danger;
    List<ChildModel> children = hiveStorageRepository.getListOfAllChild();
    List<NotificationModel> riskAssessmentsNotification = [];
    children.forEach((element) {
      NotificationModel? notificationModel;

      if (element.classification == danger &&
          element.assessmentsList.length > 0) {
        notificationModel = new NotificationModel(element,
            AppLocalizations.of(context)!.statusChanged(normal, danger));

        for (int j = element.assessmentsList.length - 1; j >= 0; j--) {
          if (element.assessmentsList[j] is Stage3Problem) {
            notificationModel = new NotificationModel(element,
                AppLocalizations.of(context)!.statusChanged(problem, danger));
            break;
          }
        }
      } else if (element.classification == problem &&
          element.assessmentsList.length > 0) {
        notificationModel = new NotificationModel(element,
            AppLocalizations.of(context)!.statusChanged(normal, problem));

        for (int j = element.assessmentsList.length - 1; j >= 0; j--) {
          if (element.assessmentsList[j] is Stage3Danger) {
            notificationModel = new NotificationModel(element,
                AppLocalizations.of(context)!.statusChanged(danger, problem));

            break;
          }
        }
      }
      if (notificationModel != null)
        riskAssessmentsNotification.add(notificationModel);
    });
    return riskAssessmentsNotification;
  }

  List<NotificationModel> fetchMonitoringAlerts() {
    String problem = AppLocalizations.of(context)!.problem;
    String danger = AppLocalizations.of(context)!.danger;
    List<ChildModel> children = hiveStorageRepository.getListOfAllChild();
    List<NotificationModel> monitoringAlertsNotifications = [];
    children.forEach((element) {
      if (element.assessmentsList.length > 0) {
        NotificationModel? notificationModel;

        if (element.classification == danger ||
            element.classification == problem) {
          Object lastAssessment = element.assessmentsList.last;
          if (lastAssessment is Stage4 && lastAssessment.isCompleted == false) {
            notificationModel = new NotificationModel(
                element, AppLocalizations.of(context)!.phase4);
          }
        }
        if (notificationModel != null)
          monitoringAlertsNotifications.add(notificationModel);
      }
    });
    return monitoringAlertsNotifications;
  }
}
