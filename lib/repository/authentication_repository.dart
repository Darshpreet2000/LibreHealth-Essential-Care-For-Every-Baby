import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/authentication_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

class AuthenticationRepository {
  BuildContext context;
  HiveStorageRepository hiveStorageRepository;
  late AuthenticationClient authenticationClient;
  AuthenticationRepository(this.context, this.hiveStorageRepository) {
    authenticationClient = AuthenticationClient(http.Client(), context);
  }
  AuthenticationRepository.test(
      this.context, this.hiveStorageRepository, this.authenticationClient);
  Future loginUser(String username, String password, String server,String orgUnit) async {
    hiveStorageRepository.saveServerURL(server);
    hiveStorageRepository.saveOrgUnit(orgUnit);
    String response = await authenticationClient.loginUser(username, password);
    Map<String, dynamic> res = jsonDecode(response);
    String avatarID = "";
    if (res.containsKey("avatar")) {
      Map<String, dynamic> avatar = res["avatar"];
      if (avatar.containsKey("id")) avatarID = avatar["id"];
    }
    Profile profile = new Profile(
        res["name"],
        "***" + res['id'].substring(res['id'].length - 3),
        username,
        password,
        avatarID);
    return profile;
  }

  bool checkUserLoggedIn() {
    return hiveStorageRepository.checkUserLoggedIn();
  }
}
