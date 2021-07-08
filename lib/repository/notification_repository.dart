import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/assessments_bloc/bloc/assessments_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/screens/baby_assessments/baby_assessments.dart';
import 'package:synchronized/synchronized.dart';

class NotificationRepository {
  final BuildContext context;
  NotificationRepository(this.context);
  static intialize(GlobalKey<NavigatorState> navigatorKey, Lock lock) async {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              importance: NotificationImportance.Max,
              channelKey: 'eceb',
              channelName: 'eceb',
              channelDescription: 'eceb',
              defaultColor: Color(0xFF9D50DD),
              ledColor: Colors.white)
        ]);
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().actionStream.listen((receivedNotification) {
      navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) {
        ChildModel childModel =
            RepositoryProvider.of<HiveStorageRepository>(context)
                .getSingleChild(receivedNotification.id.toString());
        return BabyAssessments(
            childModel,
            AssessmentsBloc(
                NotificationRepository(navigatorKey.currentContext!),
                AssessmentsRepository(
                  navigatorKey.currentContext!,
                  lock,
                  RepositoryProvider.of<HiveStorageRepository>(context),
                  RepositoryProvider.of<RefreshRepository>(context),
                ),
                childModel,
                RepositoryProvider.of<HiveStorageRepository>(context)));
      }));
    });
  }

  Future<void> showStage1Notification(String key, String motherName) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: int.parse(key),
      channelKey: 'eceb',
      title: AppLocalizations.of(context)!.babyOf(motherName),
      body: AppLocalizations.of(context)!.phase1,
    ));
  }

  Future<void> scheduledStage1Notification(
      String key, String motherName) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: int.parse(key),
          channelKey: 'eceb',
          title: AppLocalizations.of(context)!.reminder +
              ": " +
              AppLocalizations.of(context)!.babyOf(motherName),
          body: AppLocalizations.of(context)!.phase1,
        ),
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(Duration(minutes: 60))));
  }

  Future<void> removeScheduledNotification(String key) async {
    AwesomeNotifications().cancel(int.parse(key));
  }
}
