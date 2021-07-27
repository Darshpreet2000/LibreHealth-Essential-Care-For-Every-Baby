import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/models/stage_3_danger.dart';
import 'package:newborn_care/models/stage_4.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:synchronized/synchronized.dart';
import '../phase_2_test/phase_2_test.mocks.dart';

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
  //Throws exception if assesments are done before 180 mins from birth

  //Throws exception if assessments are incomplete
  //Marks phase-4 as complete if everything is correctly filled
  //Adds stage-4 assessments if list is empty
  group('AssessmentsRepository testing', () {
    testWidgets(
        'Throws exception if assesments are done before 180 mins from birth',
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
            .validatePhase4Assessments(Stage4(), DateTime.now());
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!
                    .phase4AssessmentsToBeDoneOnlyAfter180MinutesFromBirth)
                .toString());
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
        Stage4 stage4 = new Stage4();

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase4Assessments(
                stage4, DateTime.now().subtract(Duration(minutes: 185)));
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets('Marks phase-4 as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();

      Stage4 stage4 = new Stage4();
      try {
        stage4.ecebFastBreathing = true;
        stage4.ecebChestIndrawing = true;
        stage4.ecebFeedingProperly = true;
        stage4.ecebConvulsions = true;
        stage4.ecebSevereJaundice = true;
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase4Assessments(
                stage4, DateTime.now().subtract(Duration(minutes: 185)));
      } catch (e) {}
      expect(stage4.isCompleted, true);
    });
    testWidgets('Adds stage-4 assessments if list size is 3',
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
      inputChildModel.assessmentsList = [Stage1(), Stage2(), Stage3Danger()];
      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .addNextAssessment(inputChildModel);
      } catch (e) {}
      expect(inputChildModel.assessmentsList[3], isA<Stage4>());
    });
  });
}
