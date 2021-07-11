import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RefreshClient {
  http.Client client;
  BuildContext context;
  RefreshClient(this.client, this.context);
  Future doPostNetworkRequest(dynamic request) async {
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
      throw FetchDataException(
          AppLocalizations.of(context)!.noInternetConnection, 503);
    } on SocketException {
      throw FetchDataException(
          AppLocalizations.of(context)!.noInternetConnection, 503);
    }
  }

 Future doPutNetworkRequest(dynamic request) async {
    try {
      var response;

      response = await http
          .put(
            Uri.parse(request.url),
            headers: request.headers,
            body: request.data,
          )
          .timeout(const Duration(seconds: 15));
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
