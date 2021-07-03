import 'dart:convert';

import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/network/assessments_client.dart';

class AssessmentsRepository {
  void validatePhase1Assessments(Stage1 stage1) {
    if (stage1.ecebWardName.isEmpty)
      throw Exception(
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .enterWardName);

    if (stage1.ecebStage1InitiateBreastfeeding == false ||
        stage1.ecebStage1MonitorBreathing == false ||
        stage1.ecebStage1SkinToSkinCare == false)
      throw Exception(
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .completeAssessments);
    return;
  }

  Future registerStage1Details(Stage1 stage1, String id) async {
    AssessmentsClient assessmentsClient = new AssessmentsClient();
    String json = jsonEncode(stage1);
    assessmentsClient.registerEvent(json, id);
    return;
  }
}
