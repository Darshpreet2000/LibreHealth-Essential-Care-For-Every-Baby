import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/stage_1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/network/assessments_client.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:synchronized/synchronized.dart';

class AssessmentsRepository {
  final BuildContext context;
  final Lock lock;
  AssessmentsRepository(this.context, this.lock);

  void validatePhase1Assessments(Stage1 stage1) {
    if (stage1.ecebWardName.isEmpty)
      throw Exception(AppLocalizations.of(context)!.enterWardName);

    if (stage1.ecebStage1InitiateBreastfeeding == false ||
        stage1.ecebStage1MonitorBreathing == false ||
        stage1.ecebStage1SkinToSkinCare == false)
      throw Exception(AppLocalizations.of(context)!.completeAssessments);

    //marking stage as completed
    stage1.isCompleted = true;
    return;
  }

  List<Object> addNextAssessment(List<Object> assessments) {
    if (assessments.length == 0) assessments.add(Stage1());
    return assessments;
  }

  Future registerStage1Details(Stage1 stage1, String id) async {
    AssessmentsClient assessmentsClient =
        new AssessmentsClient(http.Client(), context, lock);
    String json = jsonEncode(stage1);
    assessmentsClient.registerEvent(json, id);
    return;
  }

  Future fetchAssessments(String key) async {
    AssessmentsClient assessmentsClient =
        new AssessmentsClient(http.Client(), context, lock);
    try {
      Map<String, dynamic> response =
          jsonDecode(await assessmentsClient.getAssessmentsOfChild(key));
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
