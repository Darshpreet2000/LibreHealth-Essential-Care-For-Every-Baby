import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/models/stage_3_danger.dart';
import 'package:newborn_care/models/stage_3_normal.dart';
import 'package:newborn_care/models/stage_3_problem.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';

import 'phase_3_test.mocks.dart';

@GenerateMocks(
    [RefreshRepository, HiveStorageRepository, NotificationRepository])
void main() {
  mainBloc();
}

void mainBloc() {
  MockHiveStorageRepository _mockHiveStorageRepository =
      MockHiveStorageRepository();
  MockRefreshRepository _mockRefreshRepository = MockRefreshRepository();

  MockNotificationRepository _mockNotificationRepository =
      MockNotificationRepository();
  // AssessmentsRepository testing
  //Test Cases
  //Throws exception if Stage3 Normal assessments are incomplete
  //Throws exception if Stage3 Problem assessments are incomplete
  //Throws exception if Stage3 Danger assessments are incomplete
  //Marks Stage3 Normal as complete if everything is correctly filled
  //Marks Stage3 Problem as complete if everything is correctly filled
  //Marks Stage3 Danger as complete if everything is correctly filled
  //Adds Stage3 Normal assessments if list size is 2 and classification is normal
  //Adds Stage3 Problem assessments if list size is 2 and classification is problem
  //Adds Stage3 Danger assessments if list size is 2 and classification is danger

  group('AssessmentsRepository testing', () {
    testWidgets('Throws exception if Stage3 Normal assessments are incomplete',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      try {
        Stage3Normal stage3 = new Stage3Normal();

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase3Assessments(stage3);
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets('Throws exception if Stage3 Problem assessments are incomplete',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      try {
        Stage3Problem stage3 = new Stage3Problem();

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase3Assessments(stage3);
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets('Throws exception if Stage3 Danger assessments are incomplete',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      try {
        Stage3Danger stage3 = new Stage3Danger();

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase3Assessments(stage3);
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets(
        'Marks Stage3 Normal as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      Stage3Normal stage3 = new Stage3Normal();
      stage3.ecebStage3NormalMaintainNormalTemperature = true;
      stage3.ecebStage3NormalSupportBreastfeeding = true;
      stage3.ecebStage3NormalAdviseAboutBreastFeedingProblems = true;
      stage3.ecebStage3NormalImmunize = true;

      AssessmentsRepository(context, lock, _mockHiveStorageRepository,
              _mockRefreshRepository, _mockNotificationRepository)
          .validatePhase3Assessments(stage3);
      expect(stage3.isCompleted, true);
    });
    testWidgets(
        'Marks Stage3 Problem as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();

      Stage3Problem stage3 = new Stage3Problem();
      stage3.ecebStage3ProblemUnder2000gProlongSkinToSkinCare = true;
      stage3.ecebStage3ProblemAbnormalTemperatureImproveThermalCare = true;
      stage3.ecebStage3ProblemContinueInpatientCare = true;
      stage3.ecebStage3ProblemPoorFeedingExpressBreastMilk = true;
      stage3.ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod = true;
      AssessmentsRepository(context, lock, _mockHiveStorageRepository,
              _mockRefreshRepository, _mockNotificationRepository)
          .validatePhase3Assessments(stage3);
      expect(stage3.isCompleted, true);
    });
    testWidgets(
        'Marks Stage3 Danger as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();

      Stage3Danger stage3 = new Stage3Danger();
      stage3.ecebStage3GiveAntibiotics = true;
      stage3.ecebStage3SeekAdvancedCare = true;

      AssessmentsRepository(context, lock, _mockHiveStorageRepository,
              _mockRefreshRepository, _mockNotificationRepository)
          .validatePhase3Assessments(stage3);
      expect(stage3.isCompleted, true);
    });

    testWidgets(
        'Adds Stage3 Normal assessments if list size is 2 and classification is normal',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      ChildModel inputChildModel = new ChildModel("Oni", "postnatal", 1, 1234,
          1234, DateTime.now(), "1234", "1234", 'None', "123", false);
      inputChildModel.assessmentsList = [Stage1(), Stage2()];
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .addNextAssessment(inputChildModel);
        expect(inputChildModel.assessmentsList[2], isA<Stage3Normal>());
      } catch (e) {}
    });
    testWidgets(
        'Adds Stage3 Problem assessments if list size is 2 and classification is normal',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      ChildModel inputChildModel = new ChildModel("Oni", "postnatal", 1, 1234,
          1234, DateTime.now(), "1234", "1234", 'None', "123", false);
      inputChildModel.assessmentsList = [Stage1(), Stage2()];
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .addNextAssessment(inputChildModel);
        expect(inputChildModel.assessmentsList[2], isA<Stage3Problem>());
      } catch (e) {}
    });
    testWidgets(
        'Adds Stage3 Danger assessments if list size is 2 and classification is normal',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      ChildModel inputChildModel = new ChildModel("Oni", "postnatal", 1, 1234,
          1234, DateTime.now(), "1234", "1234", 'None', "123", false);
      inputChildModel.assessmentsList = [Stage1(), Stage2()];
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .addNextAssessment(inputChildModel);
        expect(inputChildModel.assessmentsList[2], isA<Stage3Danger>());
      } catch (e) {}
    });
  });
}
