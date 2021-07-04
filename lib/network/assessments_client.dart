import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/models/request_type.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

class AssessmentsClient {
  http.Client client;
  Map<String, String> map;

  AssessmentsClient(this.client, this.map);
  Future registerEvent(String data, String id) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('testuser:Admin@123'));
    String url = DHIS2Config.serverURL +
        APIConfig().getaddEventsAPI(
            DHIS2Config.orgUnit, DHIS2Config.programECEBID, id);
    Map<String, String> headers = <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    NetworkRequest request = NetworkRequest(
        RequestType.POST, url, data, headers, id, RequestServiceType.AddEvent);
    HiveStorageRepository().storeNetworkRequest(request);
  }

  Future getAssessmentsOfChild(String id) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('testuser:Admin@123'));
    String url = DHIS2Config.serverURL +
        APIConfig().getaddEventsAPI(
            DHIS2Config.orgUnit, DHIS2Config.programECEBID, id);

    try {
      await RefreshRepository().startRefreshing();
    } catch (e) {
      throw e;
    }
    try {
      final response = await http.get(
        //get all tracked entites which were updated in 24 hours
        Uri.parse(url),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      );
      return _response(response);
    } on SocketException {
      throw FetchDataException(map["noInternetConnection"], 503);
    }
  }

  dynamic _response(response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(map["invalidRequest"], response.statusCode);
      case 401:
        throw UnauthorisedException(map["unauthorised"], response.statusCode);
      case 403:
        throw UnauthorisedException(map["invalidInput"], response.statusCode);
      default:
        throw FetchDataException(
            map["errorOccuredWhileCommunication"], response.statusCode);
    }
  }
}
