import 'dart:convert';

import 'package:newborn_care/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/list_of_babies_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

import 'package:http/http.dart' as http;

class ListOfBabiesRepository {
  Map<String, String> m = new Map();
  ListOfBabiesRepository() {
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
      "errorDuringCommunication":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .errorDuringCommunication
    });
  }
  Future fetchListOfBabies() async {
    Profile profile = HiveStorageRepository().getProfile();
    String response = await ListOfBabiesClient(http.Client(), m)
        .fetchListOfBabies(profile.username, profile.password);
    Map<String, dynamic> res = jsonDecode(response);
    List<ChildModel> result = [];
    for (var item in res['trackedEntityInstances']) {
      ChildModel childModel = ChildModel.fromJson(item['attributes']);
      result.add(childModel);
    }
    return result;
  }
}
