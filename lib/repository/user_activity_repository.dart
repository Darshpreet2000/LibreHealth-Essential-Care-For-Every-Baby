import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/exception_messages.dart';
import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/user_activity.dart';
import 'package:newborn_care/network/user_activity_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

class UserActivityRepository {
  Future fetchUsersMessages() async {
    try {
      Profile profile = HiveStorageRepository().getProfile();
      String response = await UserActivityClient(
              http.Client(), ExceptionMessages.exceptionMessagesMap, lock)
          .fetchUserMessages(profile.username, profile.password);
      Map<String, dynamic> res = jsonDecode(response);
      List<UserActivity> result = [];
      for (var item in res['messageConversations']) {
        UserActivity userActivity = UserActivity.fromJson(item);
        String details = await UserActivityClient(
                http.Client(), ExceptionMessages.exceptionMessagesMap, lock)
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
