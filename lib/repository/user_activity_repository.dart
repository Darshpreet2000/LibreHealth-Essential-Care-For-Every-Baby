import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/user_activity.dart';
import 'package:newborn_care/network/user_activity_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserActivityRepository {
  Map<String, String> m = new Map();
  UserActivityRepository() {
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
  Future fetchUsersMessages() async {
    
  }
}
