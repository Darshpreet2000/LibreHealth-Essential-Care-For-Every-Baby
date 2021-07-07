import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';

class RefreshClient {
  http.Client client;
  Map<String, String> map;
  RefreshClient(this.client, this.map);
  Future doNetworkRequest(dynamic request) async {
    try {
      var response;

      response = await http
          .post(
            Uri.parse(request.url),
            headers: request.headers,
            body: request.data,
          )
          .timeout(const Duration(seconds: 15));
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
