import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationRepository {
  static intialize() async {
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
  }

  Future<void> showStage1Notification(String key, String motherName) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: int.parse(key),
      channelKey: 'eceb',
      title: AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
          .babyOf(motherName),
      body: AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
          .phase1,
    ));
  }

  Future<void> scheduledStage1Notification(
      String key, String motherName) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: int.parse(key),
          channelKey: 'eceb',
          title: AppLocalizations.of(
                      scaffoldMessengerGlobalKey.currentContext!)!
                  .reminder +
              ": " +
              AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
                  .babyOf(motherName),
          body: AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .phase1,
        ),
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(Duration(minutes: 60))));
  }

  Future<void> removeScheduledNotification(String key) async {
    AwesomeNotifications().cancel(int.parse(key));
  }
}
