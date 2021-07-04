import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/network/assessments_client.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

class AssessmentsRepository {
  Map<String, String> m = new Map();
  AssessmentsRepository() {
    m.addAll({
      "noInternetConnection":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .noInternetConnection,
      "invalidRequest":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .invalidRequest,
      "unauthorised":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .unauthorised,
      "invalidInput":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .invalidInput,
      "errorOccuredWhileCommunication":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .errorDuringCommunication,
      "errorDuringCommunication":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .errorDuringCommunication
    });
  }
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
    stage1.isCompleted = true;
    return;
  }

  Future registerStage1Details(Stage1 stage1, String id) async {
    AssessmentsClient assessmentsClient =
        new AssessmentsClient(http.Client(), m);
    String json = jsonEncode(stage1);
    assessmentsClient.registerEvent(json, id);
    return;
  }

  Future fetchAssessments(String id) async {
    AssessmentsClient assessmentsClient =
        new AssessmentsClient(http.Client(), m);
    try {
      Map<String, dynamic> response =
          jsonDecode(await assessmentsClient.getAssessmentsOfChild(id));
      List<Object> result = [];
      for (var item in response['events']) {
        if (item['programStage'] == DHIS2Config.stage1ID &&
            item['status'] == 'COMPLETED') {
          result.add(Stage1.fromJson(item));
        }
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
