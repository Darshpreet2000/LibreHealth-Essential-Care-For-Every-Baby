import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/authentication_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthenticationRepository {
  Map<String, String> m = new Map();
  AuthenticationRepository() {
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
  Future loginUser(String username, String password) async {
    String response = await AuthenticationClient(http.Client(), m)
        .loginUser(username, password);
    Map<String, dynamic> res = jsonDecode(response);
    Profile profile = new Profile(res["name"],
        "***" + res['id'].substring(res['id'].length - 3), username, password);
    return profile;
  }

  bool checkUserLoggedIn() {
    return HiveStorageRepository().checkUserLoggedIn();
  }
}
