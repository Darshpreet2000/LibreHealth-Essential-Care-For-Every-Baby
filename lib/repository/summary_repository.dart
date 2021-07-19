import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/summary_api_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummaryRepository {
  BuildContext context;
  HiveStorageRepository hiveStorageRepository;
  late SummaryApiClient summaryApiClient;
  SummaryRepository(this.hiveStorageRepository, this.context) {
    summaryApiClient = new SummaryApiClient(http.Client(), context);
  }

  Future fetchSummaryOf24Hours() async {
    int admitted = 0, complete = 0, danger = 0;
    Profile profile = hiveStorageRepository.getProfile();
    var response = await summaryApiClient.fetchSummaryOf24Hours(
        profile.username, profile.password);
    Map<String, dynamic> res = json.decode(response);
    for (var item in res['enrollments']) {
      admitted++;
      if (item["status"] == "COMPLETE") complete++;
    }
    List<ChildModel> childList = hiveStorageRepository.getListOfAllChild();
    childList.forEach((element) {
      if (element.classification == AppLocalizations.of(context)!.danger) {
        danger++;
      }
    });
    return [admitted, complete, danger];
  }
}
