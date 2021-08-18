import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:synchronized/synchronized.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserActivityClient {
  http.Client client;
  BuildContext context;
  RefreshRepository refreshRepository;
  Lock lock;
  UserActivityClient(
      this.client, this.context, this.lock, this.refreshRepository);

  Future fetchUserMessages(
      String username, String password, int currentPage) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    try {
      await lock.synchronized(refreshRepository.startRefreshing);
    } catch (e) {
      throw e;
    }
    try {
      final response = await http.get(
        Uri.parse(DHIS2Config.serverURL +
            APIConfig().userMessages +
            "?pageSize=5&page=$currentPage"),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      ).timeout(const Duration(seconds: 20));
      return _response(response);
    } on TimeoutException {
      throw FetchDataException(
          AppLocalizations.of(context)!.noInternetConnection, 503);
    } on SocketException {
      throw FetchDataException(
          AppLocalizations.of(context)!.noInternetConnection, 503);
    }
  }

  Future fetchUserMessagesDetails(
      String username, String password, String id) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    try {
      await lock.synchronized(refreshRepository.startRefreshing);
    } catch (e) {
      throw e;
    }
    try {
      final response = await http.get(
        Uri.parse(DHIS2Config.serverURL + APIConfig().userMessages + "/$id"),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      ).timeout(const Duration(seconds: 20));
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
