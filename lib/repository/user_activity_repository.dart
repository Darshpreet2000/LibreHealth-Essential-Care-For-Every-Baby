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
      "errorOccuredWhileCommunication":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .errorDuringCommunication,
      "errorDuringCommunication":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .errorDuringCommunication
    });
  }
  Future fetchUsersMessages() async {
    try {
      Profile profile = HiveStorageRepository().getProfile();
      String response = await UserActivityClient(http.Client(), m, lock)
          .fetchUserMessages(profile.username, profile.password);
      Map<String, dynamic> res = jsonDecode(response);
      List<UserActivity> result = [];
      for (var item in res['messageConversations']) {
        UserActivity userActivity = UserActivity.fromJson(item);
        String details = await UserActivityClient(http.Client(), m, lock)
            .fetchUserMessagesDetails(
                profile.username, profile.password, userActivity.id);
        res = jsonDecode(details);
        userActivity.dateTime = DateTime.parse(res["created"]);
        result.add(userActivity);
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
