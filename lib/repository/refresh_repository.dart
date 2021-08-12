import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/network/refresh_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

class RefreshRepository {
  BuildContext context;
  RefreshRepository(this.context);
  void startRefreshing() async {
    try {
      List<NetworkRequest> networkRequests =
          HiveStorageRepository().getNetworkRequests();
      //get map of list of child
      while (networkRequests.isNotEmpty) {
        NetworkRequest request = networkRequests.first;

        if (request.requestServiceType == RequestServiceType.addEvent ||
            request.requestServiceType == RequestServiceType.updateRequest) {
          addTrackedEntityIDInRequest(request);
        }
        if (request.requestServiceType ==
            RequestServiceType.updateEnrollmentStatusRequest) {
          addEnrollmentIDInRequest(request);
        }
        var response;
        if (request.requestServiceType == RequestServiceType.updateRequest ||
            request.requestServiceType ==
                RequestServiceType.updateEnrollmentStatusRequest)
          response = await RefreshClient(http.Client(), context)
              .doPutNetworkRequest(request);
        else
          response = await RefreshClient(http.Client(), context)
              .doPostNetworkRequest(request);

        if (request.requestServiceType == RequestServiceType.registerBaby) {
          updateChildTrackedEntityIDAndEnrollmentID(response, request.key);
        }
        networkRequests.removeAt(0);
        HiveStorageRepository().storeNetworkRequestList(networkRequests);
      }
    } catch (e) {
      throw e;
    }
  }

  void addEnrollmentIDInRequest(NetworkRequest request) {
    String enrollmentID =
        HiveStorageRepository().getSingleChild(request.key).enrollmentID;
    request.url = request.url.replaceAll(request.key, enrollmentID);
  }

  void addTrackedEntityIDInRequest(NetworkRequest request) {
    String trackedEntityId =
        HiveStorageRepository().getSingleChild(request.key).trackedEntityID;
    if (request.requestServiceType == RequestServiceType.addEvent)
      request.url = DHIS2Config.serverURL +
          APIConfig().getaddEventsAPI(
              DHIS2Config.orgUnit, DHIS2Config.programECEBID, trackedEntityId);
    else if (request.requestServiceType == RequestServiceType.updateRequest)
      request.url = DHIS2Config.serverURL +
          APIConfig().trackedEntityInstance +
          "/$trackedEntityId";

    request.data =
        request.data.replaceAll(DHIS2Config.trackedEntity, trackedEntityId);
  }

  void updateChildTrackedEntityIDAndEnrollmentID(var res, String key) {
    var json = jsonDecode(res);
    var response = (json["response"]);
    var importSummary = (response["importSummaries"]);
    var importArray = (importSummary[0]);
    String originalTrackedEntityID = (importArray["reference"]);
    var enrollments = (importArray["enrollments"]);
    var enrollmentSummary = enrollments["importSummaries"];
    var originalEnrollmentID = enrollmentSummary[0]["reference"];
    //update trackedEntity id and enrollment ID
    ChildModel child = HiveStorageRepository().getSingleChild(key);
    child.trackedEntityID = originalTrackedEntityID;
    child.enrollmentID = originalEnrollmentID;
    HiveStorageRepository().updateChild(child.key, child);
  }
}
