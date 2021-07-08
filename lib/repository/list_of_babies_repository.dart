import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/list_of_babies_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

import 'package:http/http.dart' as http;
import 'package:synchronized/synchronized.dart';

class ListOfBabiesRepository {
  Lock lock;
  BuildContext context;
  ListOfBabiesRepository(this.context, this.lock);
  Future fetchListOfBabies() async {
    try {
      Profile profile = HiveStorageRepository().getProfile();
      String response = await ListOfBabiesClient(http.Client(), context, lock)
          .fetchListOfBabies(profile.username, profile.password);
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
