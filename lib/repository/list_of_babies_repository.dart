import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/list_of_babies_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

import 'package:http/http.dart' as http;
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';

class ListOfBabiesRepository {
  Lock lock;
  BuildContext context;
  late ListOfBabiesClient listOfBabiesClient;
  HiveStorageRepository hiveStorageRepository;
  RefreshRepository refreshRepository;
  ListOfBabiesRepository(this.context, this.lock, this.hiveStorageRepository,
      this.refreshRepository) {
    listOfBabiesClient =
        ListOfBabiesClient(http.Client(), context, lock, refreshRepository);
  }
  ListOfBabiesRepository.test(
      this.context,
      this.lock,
      this.hiveStorageRepository,
      this.refreshRepository,
      this.listOfBabiesClient);

  Future fetchListOfBabies() async {
    try {
      Profile profile = hiveStorageRepository.getProfile();
      String response = await listOfBabiesClient.fetchListOfBabies(
          profile.username, profile.password);
      Map<String, dynamic> res = jsonDecode(response);
      List<ChildModel> result = [];
      for (var item in res['trackedEntityInstances']) {
        ChildModel childModel = ChildModel.fromJson(item);
        result.add(childModel);
      }
      return result;
    } catch (e) {
      throw e;
    }
  }

  void seperateRecentAndPastRegistered(List<ChildModel> recentList,
      List<ChildModel> pastRegistered, List<ChildModel> childListMap) {
    childListMap.sort((a, b) => b.birthTime.compareTo(a.birthTime));

    childListMap.forEach((element) {
      if ((DateTime.now()).difference(element.birthTime).inHours < 24) {
        recentList.add(element);
      } else {
        pastRegistered.add(element);
      }
    });
  }
}
