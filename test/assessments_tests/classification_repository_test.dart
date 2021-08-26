import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/repository/classification_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

import 'assessments_client/assessments_client_test.mocks.dart';

void main() {
  classificationRepositoryTest();
}

void classificationRepositoryTest() {
  final _mockHive = new MockHiveStorageRepository();
  group('Classification Repository testing', () {
    testWidgets('if temperature < 95.5 or > 99.5 then classifies as danger',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      when(_mockHive.containsProgramRule(DHIS2Config.programRuleNormalID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleDangerID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleProblemID))
          .thenReturn(false);
      Stage2 stage2 = new Stage2();
      stage2.ecebWardName = "postnatal";
      stage2.ecebAssessTemperature = 101;
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
      expect(
          ClassificationRepository(context, _mockHive).classifyBabyHealth(
              ecebSevereJaundice: stage2.ecebSevereJaundice,
              ecebAssessTemperature: stage2.ecebAssessTemperature,
              ecebWeight: stage2.ecebWeight,
              ecebChestIndrawing: stage2.ecebChestIndrawing,
              ecebFeedingProperly: stage2.ecebFeedingProperly,
              ecebFastBreathing: stage2.ecebFastBreathing,
              ecebConvulsions: stage2.ecebConvulsions),
          AppLocalizations.of(context)!.danger);
    });
    testWidgets(
        'if severe jaundice or fast breathing then classifies as danger',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      when(_mockHive.containsProgramRule(DHIS2Config.programRuleNormalID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleDangerID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleProblemID))
          .thenReturn(false);
      Stage2 stage2 = new Stage2();
      stage2.ecebWardName = "postnatal";
      stage2.ecebAssessTemperature = 98;
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
      expect(
          ClassificationRepository(context, _mockHive).classifyBabyHealth(
              ecebSevereJaundice: stage2.ecebSevereJaundice,
              ecebAssessTemperature: stage2.ecebAssessTemperature,
              ecebWeight: stage2.ecebWeight,
              ecebChestIndrawing: stage2.ecebChestIndrawing,
              ecebFeedingProperly: stage2.ecebFeedingProperly,
              ecebFastBreathing: stage2.ecebFastBreathing,
              ecebConvulsions: stage2.ecebConvulsions),
          AppLocalizations.of(context)!.danger);
    });

    testWidgets('if weight < 2000 & poor feeding then classifies as problem',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      when(_mockHive.containsProgramRule(DHIS2Config.programRuleNormalID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleDangerID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleProblemID))
          .thenReturn(false);
      Stage2 stage2 = new Stage2();
      stage2.ecebWardName = "postnatal";
      stage2.ecebAssessTemperature = 98;
      stage2.ecebWeight = 1700;
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
      stage2.ecebFastBreathing = false;
      stage2.ecebChestIndrawing = false;
      stage2.ecebFeedingProperly = false;
      stage2.ecebConvulsions = false;
      stage2.ecebSevereJaundice = false;
      expect(
          ClassificationRepository(context, _mockHive).classifyBabyHealth(
              ecebSevereJaundice: stage2.ecebSevereJaundice,
              ecebAssessTemperature: stage2.ecebAssessTemperature,
              ecebWeight: stage2.ecebWeight,
              ecebChestIndrawing: stage2.ecebChestIndrawing,
              ecebFeedingProperly: stage2.ecebFeedingProperly,
              ecebFastBreathing: stage2.ecebFastBreathing,
              ecebConvulsions: stage2.ecebConvulsions),
          AppLocalizations.of(context)!.problem);
    });
    testWidgets('if everything is normal then classifies as normal',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(child: Container()),
          localizationsDelegates: [
            AppLocalizations.delegate,
          ]));
      BuildContext context = tester.element(find.byType(Container));
      when(_mockHive.containsProgramRule(DHIS2Config.programRuleNormalID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleDangerID))
          .thenReturn(false);

      when(_mockHive.containsProgramRule(DHIS2Config.programRuleProblemID))
          .thenReturn(false);
      Stage2 stage2 = new Stage2();
      stage2.ecebWardName = "postnatal";
      stage2.ecebAssessTemperature = 98;
      stage2.ecebWeight = 2200;
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
      stage2.ecebFastBreathing = false;
      stage2.ecebChestIndrawing = false;
      stage2.ecebFeedingProperly = true;
      stage2.ecebConvulsions = false;
      stage2.ecebSevereJaundice = false;
      expect(
          ClassificationRepository(context, _mockHive).classifyBabyHealth(
              ecebSevereJaundice: stage2.ecebSevereJaundice,
              ecebAssessTemperature: stage2.ecebAssessTemperature,
              ecebWeight: stage2.ecebWeight,
              ecebChestIndrawing: stage2.ecebChestIndrawing,
              ecebFeedingProperly: stage2.ecebFeedingProperly,
              ecebFastBreathing: stage2.ecebFastBreathing,
              ecebConvulsions: stage2.ecebConvulsions),
          AppLocalizations.of(context)!.normal);
    });
  });
}
