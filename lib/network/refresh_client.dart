import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/models/request_type.dart';

class RefreshClient {
  http.Client client;
  Map<String, String> map;
  RefreshClient(this.client, this.map);
  Future doNetworkRequest(dynamic request) async {
    try {
      var response;
      if (request.type == RequestType.POST)
        response = await http.post(
          Uri.parse(request.url),
          headers: request.headers,
          body: request.data,
        );
      else
        response = await http.get(
          Uri.parse(request.url),
          headers: request.headers,
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
