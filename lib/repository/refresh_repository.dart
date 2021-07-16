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
        if (request.requestServiceType == RequestServiceType.addEvent) {
          addTrackedEntityIDInRequest(request);
        }
        var response = await RefreshClient(http.Client(), context)
            .doNetworkRequest(request);

        if (request.requestServiceType == RequestServiceType.registerBaby) {
          updateChildTrackedEntityID(response, request.key);
        }
        networkRequests.removeAt(0);
        HiveStorageRepository().storeNetworkRequestList(networkRequests);
      }
    } catch (e) {
      throw e;
    }
  }

  void addTrackedEntityIDInRequest(NetworkRequest request) {
    String trackedEntityId =
        HiveStorageRepository().getSingleChild(request.key).trackedEntityID;
    request.url = DHIS2Config.serverURL +
        APIConfig().getaddEventsAPI(
            DHIS2Config.orgUnit, DHIS2Config.programECEBID, trackedEntityId);
    request.data =
        request.data.replaceAll(DHIS2Config.trackedEntity, trackedEntityId);
  }

  void updateChildTrackedEntityID(var res, String key) {
    var json = jsonDecode(res);
    var response = (json["response"]);
    var importSummary = (response["importSummaries"]);
    var importArray = (importSummary[0]);
    String responseKey = (importArray["reference"]);

    //update trackedEntity id
    ChildModel child = HiveStorageRepository().getSingleChild(key);
    child.trackedEntityID = responseKey;
    HiveStorageRepository().updateChild(child.key, child);
  }
}
