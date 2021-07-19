import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummaryApiClient {
  http.Client client;
  BuildContext context;
  SummaryApiClient(
      this.client, this.context);
  Future fetchSummaryOf24Hours(String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
  
    try {
      final response = await client.get(
        //get all enrollments  which were updated in 24 hours
        Uri.parse(DHIS2Config.serverURL +
            APIConfig().enrollments +
            "?ou=${DHIS2Config.orgUnit}&program=${DHIS2Config.programECEBID}&lastUpdatedDuration=1d"),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      );
      return _response(response);
    } on TimeoutException {
      throw FetchDataException(
          AppLocalizations.of(context)!.noInternetConnection, 503);
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
