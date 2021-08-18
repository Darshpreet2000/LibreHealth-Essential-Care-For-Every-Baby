import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgramRuleClient {
  http.Client client;
  BuildContext context;
  ProgramRuleClient(this.client, this.context);

  Future fetchProgramRules(String username, String password, String id) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    try {
      final response = await client.get(
        Uri.parse(APIConfig().getProgramRulesAPI(id)),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      );
      return _response(response);
    } on SocketException {
      throw FetchDataException(
          AppLocalizations.of(context)!.noInternetConnection, 503);
    }
  }

  dynamic _response(response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(
            AppLocalizations.of(context)!.invalidRequest, response.statusCode);
      case 401:
        throw UnauthorisedException(
            AppLocalizations.of(context)!.unauthorised, response.statusCode);
      case 403:
        throw UnauthorisedException(
            AppLocalizations.of(context)!.invalidInput, response.statusCode);
      default:
        throw FetchDataException(
            AppLocalizations.of(context)!.errorDuringCommunication,
            response.statusCode);
    }
  }
}
