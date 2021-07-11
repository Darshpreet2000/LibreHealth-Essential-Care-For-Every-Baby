import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/request_type.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'dart:convert';

class RegisterBabyAPIClient {
  Future registerBabyDetailsAsTrackedEntity(String data) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('testuser:Admin@123'));
    String url = DHIS2Config().serverURL + APIConfig().trackedEntityInstance;
    Map<String, String> headers = <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    NetworkRequest request =
        NetworkRequest(RequestType.POST, url, data, headers);
    HiveStorageRepository().storeNetworkRequest(request);
  }
}
