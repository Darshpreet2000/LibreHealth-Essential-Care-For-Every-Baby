import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/exceptions/custom_exceptions.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:synchronized/synchronized.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AssessmentsClient {
  http.Client client;
  BuildContext context;
  HiveStorageRepository hiveStorageRepository;
  RefreshRepository refreshRepository;
  Lock lock;
  AssessmentsClient(this.client, this.context, this.lock,
      this.hiveStorageRepository, this.refreshRepository);
  Future registerEvent(
      String data, String id, String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String url = DHIS2Config.serverURL +
        APIConfig().getaddEventsAPI(
            DHIS2Config.orgUnit, DHIS2Config.programECEBID, id);
    Map<String, String> headers = <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    NetworkRequest request =
        NetworkRequest(url, data, headers, id, RequestServiceType.addEvent);
    hiveStorageRepository.storeNetworkRequest(request);
  }

  Future updateEnrollmentStatus(
      String username, String password, String key) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String url = DHIS2Config.serverURL + "/api/enrollments/$key/completed";
    Map<String, String> headers = <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    NetworkRequest request = NetworkRequest(url, "", headers, key,
        RequestServiceType.updateEnrollmentStatusRequest);
    hiveStorageRepository.storeNetworkRequest(request);
  }

  Future updateTrackedEntity(
      String data, String id, String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String url = DHIS2Config.serverURL +
        APIConfig().trackedEntityInstance +
        "/${DHIS2Config.trackedEntity}";
    Map<String, String> headers = <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    };
    NetworkRequest request = NetworkRequest(
        url, data, headers, id, RequestServiceType.updateRequest);
    hiveStorageRepository.storeNetworkRequest(request);
  }

  Future getAssessmentsOfChild(
      String key, String username, String password) async {
    try {
      await lock.synchronized(refreshRepository.startRefreshing);
    } catch (e) {
      throw e;
    }
    try {
      String trackedEntityID =
          hiveStorageRepository.getSingleChild(key).trackedEntityID;
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      String url = DHIS2Config.serverURL +
          APIConfig().getaddEventsAPI(
              DHIS2Config.orgUnit, DHIS2Config.programECEBID, trackedEntityID);
      final response = await client.get(
        //get all tracked entites which were updated in 24 hours
        Uri.parse(url),
        headers: <String, String>{
          'authorization': basicAuth,
        },
      ).timeout(const Duration(seconds: 10));
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
