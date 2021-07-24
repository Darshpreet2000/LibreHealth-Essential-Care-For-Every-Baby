import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/notification_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/models/stage_3_danger.dart';
import 'package:newborn_care/models/stage_3_problem.dart';
import 'package:newborn_care/models/stage_4.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_screen_repository.dart';

import 'notification_bloc_test.mocks.dart';

@GenerateMocks([NotificationScreenRepository, HiveStorageRepository])
void main() {
  mainBloc();
}

void mainBloc() {
  final _mockHive = MockHiveStorageRepository();
  //Flutter Notifcation Repository test
  //Test Cases

  // Risk Assessments Test cases

  //status changed normal to danger
  //status changed problem to danger
  //status changed normal to problem
  //status changed danger to problem

  // Monitoring Alerts Test cases

//  stage-4 assessments next

  group('NotifcationBloc testing', () {
    testWidgets('status changed normal to danger', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      String normal = AppLocalizations.of(context)!.normal;
      String danger = AppLocalizations.of(context)!.danger;

      ChildModel childModel = ChildModel("Oni", "postnatal", 1, 1234, 1234,
          DateTime.now(), "1234", "1234", 'Danger', 1, 'normal');
      childModel.assessmentsList = [Stage1(), Stage2(), Stage3Danger()];
      List<ChildModel> children = [childModel];
      NotificationScreenRepository notificationRepository =
          new NotificationScreenRepository(context, _mockHive);
      when(_mockHive.getListOfAllChild()).thenReturn(children);

      List<NotificationModel> list = [
        NotificationModel(childModel,
            AppLocalizations.of(context)!.statusChanged(normal, danger))
      ];
      assert(
          notificationRepository.fetchRiskAssessmentsList().first.messageText ==
              list.first.messageText);
    });

    testWidgets('status changed problem to danger',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      String normal = AppLocalizations.of(context)!.normal;
      String problem = AppLocalizations.of(context)!.problem;

      ChildModel childModel = ChildModel("Oni", "postnatal", 1, 1234, 1234,
          DateTime.now(), "1234", "1234", 'Problem', 1, 'normal');
      childModel.assessmentsList = [Stage1(), Stage2(), Stage3Problem()];
      List<ChildModel> children = [childModel];
      NotificationScreenRepository notificationRepository =
          new NotificationScreenRepository(context, _mockHive);
      when(_mockHive.getListOfAllChild()).thenReturn(children);

      List<NotificationModel> list = [
        NotificationModel(childModel,
            AppLocalizations.of(context)!.statusChanged(normal, problem))
      ];
      assert(
          notificationRepository.fetchRiskAssessmentsList().first.messageText ==
              list.first.messageText);
    });

    testWidgets('status changed normal to problem',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      String normal = AppLocalizations.of(context)!.normal;
      String problem = AppLocalizations.of(context)!.problem;

      ChildModel childModel = ChildModel("Oni", "postnatal", 1, 1234, 1234,
          DateTime.now(), "1234", "1234", 'Problem', 1, 'normal');
      childModel.assessmentsList = [Stage1(), Stage2(), Stage3Problem()];
      List<ChildModel> children = [childModel];
      NotificationScreenRepository notificationRepository =
          new NotificationScreenRepository(context, _mockHive);
      when(_mockHive.getListOfAllChild()).thenReturn(children);

      List<NotificationModel> list = [
        NotificationModel(childModel,
            AppLocalizations.of(context)!.statusChanged(normal, problem))
      ];
      assert(
          notificationRepository.fetchRiskAssessmentsList().first.messageText ==
              list.first.messageText);
    });

    testWidgets('status changed danger to problem',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      String problem = AppLocalizations.of(context)!.problem;
      String danger = AppLocalizations.of(context)!.danger;

      ChildModel childModel = ChildModel("Oni", "postnatal", 1, 1234, 1234,
          DateTime.now(), "1234", "1234", 'Problem', 1, 'normal');
      childModel.assessmentsList = [Stage1(), Stage2(), Stage3Danger()];
      List<ChildModel> children = [childModel];
      NotificationScreenRepository notificationRepository =
          new NotificationScreenRepository(context, _mockHive);
      when(_mockHive.getListOfAllChild()).thenReturn(children);

      List<NotificationModel> list = [
        NotificationModel(childModel,
            AppLocalizations.of(context)!.statusChanged(danger, problem))
      ];
      assert(
          notificationRepository.fetchRiskAssessmentsList().first.messageText ==
              list.first.messageText);
    });

    testWidgets('stage-4 assessments next', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));

      ChildModel childModel = ChildModel("Oni", "postnatal", 1, 1234, 1234,
          DateTime.now(), "1234", "1234", 'Problem', 1, 'normal');
      childModel.assessmentsList = [
        Stage1(),
        Stage2(),
        Stage3Danger(),
        Stage4()
      ];
      List<ChildModel> children = [childModel];
      NotificationScreenRepository notificationRepository =
          new NotificationScreenRepository(context, _mockHive);
      when(_mockHive.getListOfAllChild()).thenReturn(children);

      List<NotificationModel> list = [
        NotificationModel(childModel, AppLocalizations.of(context)!.phase4)
      ];
      assert(notificationRepository.fetchMonitoringAlerts().first.messageText ==
          list.first.messageText);
    });
  });
}
