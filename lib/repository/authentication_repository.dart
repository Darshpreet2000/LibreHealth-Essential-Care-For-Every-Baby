import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/authentication_client.dart';
import 'package:newborn_care/repository/HiveStorageRepository.dart';

class AuthenticationRepository {
  Future loginUser(String username, String password) async {
    String response =
        await AuthenticationClient(http.Client()).loginUser(username, password);
    Map<String, dynamic> res = jsonDecode(response);
    Profile profile = new Profile(res["name"],
        "***" + res['id'].substring(res['id'].length - 3), username, password);
    return profile;
  }

  bool checkUserLoggedIn() {
   return HiveStorageRepository().checkUserLoggedIn();
  }
}
