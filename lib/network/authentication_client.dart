import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/main.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AuthenticationClient {
  Future loginUser(String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    try {
      final response = await http.get(
        Uri.parse(DHIS2Config().serverURL + APIConfig().login),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      );
      return _response(response);
    } on SocketException {
      throw FetchDataException(AppLocalizations.of(drawerKey!.currentContext!)!.noInternetConnection);
    }
  }

  dynamic _response(response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode);
      case 401:
        throw UnauthorisedException(response.statusCode);
      case 403:
        throw UnauthorisedException(response.statusCode);
      default:
        throw FetchDataException(
            AppLocalizations.of(drawerKey!.currentContext!)!.errorOccuredWhileCommunication(response.statusCode));
    }
  }
}
