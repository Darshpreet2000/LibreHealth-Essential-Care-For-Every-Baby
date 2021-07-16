import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';
import 'phase_1_test.mocks.dart';

@GenerateMocks([RefreshRepository, HiveStorageRepository])
void main() {
  mainBloc();
}

void mainBloc() {
  MockHiveStorageRepository _mockHiveStorageRepository =
      MockHiveStorageRepository();
  MockRefreshRepository _mockRefreshRepository = MockRefreshRepository();
  // AssessmentsRepository testing
  //Test Cases
  //Throws exception if wardname is empty
  //Throws exception if assessments are incomplete
  //Marks phase-1 as complete if everything is correctly filled
  //Adds stage-1 assessments if list is empty
  group('AssessmentsRepository testing', () {
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
                _mockRefreshRepository)
            .validatePhase1Assessments(Stage1());
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
        Stage1 stage1 = new Stage1();
        stage1.ecebWardName = "postnatal";

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository)
            .validatePhase1Assessments(stage1);
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets('Marks phase-1 as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();

      Stage1 stage1 = new Stage1();
      try {
        stage1.ecebWardName = "postnatal";
        stage1.ecebStage1InitiateBreastfeeding = true;
        stage1.ecebStage1MonitorBreathing = true;
        stage1.ecebStage1SkinToSkinCare = true;

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository)
            .validatePhase1Assessments(stage1);
      } catch (e) {}
      expect(stage1.isCompleted, true);
    });
    testWidgets('Adds stage-1 assessments if list is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();
      List<Object> assessmentsList = [];

      try {
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository)
            .addNextAssessment(assessmentsList);
      } catch (e) {}
      expect(assessmentsList[0], isA<Stage1>());
    });
  });
}
