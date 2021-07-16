import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'dart:convert';

class RegisterBabyAPIClient {
  HiveStorageRepository hiveStorageRepository;
  RegisterBabyAPIClient(this.hiveStorageRepository);
  Future registerBabyDetailsAsTrackedEntity(
      String data, String key, String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String url = DHIS2Config.serverURL + APIConfig().trackedEntityInstance;
    Map<String, String> headers = <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    NetworkRequest request = NetworkRequest(
        url, data, headers, key, RequestServiceType.registerBaby);
    hiveStorageRepository.storeNetworkRequest(request);
  }
}
