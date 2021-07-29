import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newborn_care/models/stage_5.dart';
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

  //Throws exception if assessments are incomplete
  //Marks phase-5 as complete if everything is correctly filled
  //marks child as discharged
  group('AssessmentsRepository testing', () {
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
        Stage5 stage5 = new Stage5();

        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase5Assessments(stage5);
      } catch (e) {
        expect(
            e.toString(),
            Exception(AppLocalizations.of(context)!.completeAssessments)
                .toString());
      }
    });
    testWidgets('Marks phase-5 as complete if everything is correctly filled',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      var lock = Lock();

      Stage5 stage5 = new Stage5();
      try {
        stage5.ecebStage5NormalGiveparentsguidanceforhomecare = true;
        stage5.ecebStage5NormalReassessBabyfordischarge = true;
        AssessmentsRepository(context, lock, _mockHiveStorageRepository,
                _mockRefreshRepository, _mockNotificationRepository)
            .validatePhase5Assessments(stage5);
      } catch (e) {}
      expect(stage5.isCompleted, true);
    });
  });
}
