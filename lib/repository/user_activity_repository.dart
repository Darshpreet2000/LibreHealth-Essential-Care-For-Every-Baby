import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/user_activity.dart';
import 'package:newborn_care/network/user_activity_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';

class UserActivityRepository {
  Lock lock;
  BuildContext context;
  late UserActivityClient userActivityClient;
  HiveStorageRepository hiveStorageRepository;
  RefreshRepository refreshRepository;
  NotificationRepository notificationRepository;
  UserActivityRepository(this.context, this.lock, this.hiveStorageRepository,
      this.refreshRepository, this.notificationRepository) {
    userActivityClient =
        new UserActivityClient(http.Client(), context, lock, refreshRepository);
  }

  int countNewNotifications(List<UserActivity> newList) {
    int count = newList.length;
    List<UserActivity> oldList = hiveStorageRepository.getNotificationsList();
    newList.forEach((newElement) {
      for (var oldElement in oldList) {
        if (oldElement.id == newElement.id) {
          count--;
          break;
        }
      }
    });

    return count;
  }

  Future fetchUsersMessages(int currentPage) async {
    try {
      Profile profile = hiveStorageRepository.getProfile();
      String response = await userActivityClient.fetchUserMessages(
          profile.username, profile.password, currentPage);
      Map<String, dynamic> res = jsonDecode(response);
      List<UserActivity> result = [];
      int maxPageSize = res['pager']['pageCount'];
      if (currentPage > maxPageSize) throw Exception();
      for (var item in res['messageConversations']) {
        UserActivity userActivity = UserActivity.fromJson(item);
        String details = await userActivityClient.fetchUserMessagesDetails(
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
