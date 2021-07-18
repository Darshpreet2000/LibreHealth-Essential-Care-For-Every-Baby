import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';

import 'phase_2_test.mocks.dart';

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
  //Throws exception if assesments are done before 60 mins from birth
  //Throws exception if wardname is empty
  //Throws exception if assessments are incomplete
  //Marks phase-2 as complete if everything is correctly filled
  //Adds stage-2 assessments if list is empty
  group('AssessmentsRepository testing', () {
    testWidgets(
        'Throws exception if assesments are done before 60 mins from birth',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase2Assessments(Stage2(), DateTime.now());
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!
                    .phase2AssessmentsToBeDoneOnlyAfter60MinutesFromBirth)
                .toString());
      }
    });
    testWidgets('Throws exception if wardname is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase2Assessments(
                Stage2(), DateTime.now().subtract(Duration(minutes: 80)));
      } catch (e) {
        expect(e.toString(),
            Exception(AppLocalizations.of(context)!.enterWardName).toString());
      }
    });

    testWidgets('Throws exception if assessments are incomplete',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      try {
        Stage2 stage2 = new Stage2();
        stage2.ecebWardName = "postnatal";

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase2Assessments(
                stage2, DateTime.now().subtract(Duration(minutes: 80)));
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets('Marks phase-2 as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();

      Stage2 stage2 = new Stage2();
      try {
        stage2.ecebWardName = "postnatal";
        stage2.ecebStage2PreventDiseaseVitaminK = true;
        stage2.ecebStage2PreventDiseaseCordCare = true;
        stage2.ecebStage2PreventDiseaseEyeCare = true;
        stage2.ecebExaminationHead = true;
        stage2.ecebExaminationGenitalia = true;
        stage2.ecebExaminationEyes = true;
        stage2.ecebExaminationAnus = true;
        stage2.ecebExaminationEarsNoseThroat = true;
        stage2.ecebExaminationMuscoskeletal = true;
        stage2.ecebExaminationChest = true;
        stage2.ecebExaminationNeurology = true;
        stage2.ecebExaminationCardiovascular = true;
        stage2.ecebExaminationSkin = true;
        stage2.ecebExaminationAbdomen = true;
        stage2.ecebExaminationOverall = true;
        stage2.ecebFastBreathing = true;
        stage2.ecebChestIndrawing = true;
        stage2.ecebFeedingProperly = true;
        stage2.ecebConvulsions = true;
        stage2.ecebSevereJaundice = true;
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase2Assessments(
                stage2, DateTime.now().subtract(Duration(minutes: 80)));
      } catch (e) {}
      expect(stage2.isCompleted, true);
    });
    testWidgets('Adds stage-2 assessments if list size is 1',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      ChildModel inputChildModel = new ChildModel("Oni", "postnatal", 1, 1234,
          1234, DateTime.now(), "1234", "1234", 'None', 1, 'normal');
      inputChildModel.assessmentsList = [Stage1()];
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .addNextAssessment(inputChildModel);
      } catch (e) {}
      expect(inputChildModel.assessmentsList[1], isA<Stage2>());
    });
  });
}
