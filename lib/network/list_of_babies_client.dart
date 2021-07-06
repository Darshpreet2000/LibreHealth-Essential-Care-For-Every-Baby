import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:synchronized/synchronized.dart';

class ListOfBabiesClient {
  http.Client client;
  Map<String, String> map;
  Lock lock;
  ListOfBabiesClient(this.client, this.map, this.lock);
  Future fetchListOfBabies(String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    try {
      await lock.synchronized(RefreshRepository().startRefreshing);
    } catch (e) {
      throw e;
    }
    try {
      final response = await client.get(
        //get all tracked entites which were updated in 24 hours
        Uri.parse(DHIS2Config.serverURL +
            APIConfig().trackedEntityInstance +
            "?ou=${DHIS2Config.orgUnit}&program=${DHIS2Config.programECEBID}&lastUpdatedStartDate=${DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1)))}"),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      ).timeout(const Duration(seconds: 10));
      return _response(response);
    } on TimeoutException {
      throw FetchDataException(map["noInternetConnection"], 503);
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
