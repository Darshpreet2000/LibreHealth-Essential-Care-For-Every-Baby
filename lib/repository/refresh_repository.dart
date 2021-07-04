import 'dart:convert';

import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/network/refresh_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:newborn_care/utils/api_config.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

class RefreshRepository {
  Map<String, String> m = new Map();
  RefreshRepository() {
    m.addAll({
      "noInternetConnection":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .noInternetConnection,
      "invalidRequest":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .invalidRequest,
      "unauthorised":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .unauthorised,
      "invalidInput":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .invalidInput,
      "errorDuringCommunication":
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .errorDuringCommunication
    });
  }
  Future<void> startRefreshing() async {
    try {
      List<NetworkRequest> networkRequests =
          HiveStorageRepository().getNetworkRequests();
      //get map of list of child
      while (networkRequests.isNotEmpty) {
        NetworkRequest request = networkRequests.first;
        if (request.requestServiceType == RequestServiceType.AddEvent) {
          String trackedEntityId = HiveStorageRepository()
              .getSingleChild(request.key)
              .trackedEntityID;
          request.url = DHIS2Config.serverURL +
              APIConfig().getaddEventsAPI(DHIS2Config.orgUnit,
                  DHIS2Config.programECEBID, trackedEntityId);
        }
        var response =
            await RefreshClient(http.Client(), m).doNetworkRequest(request);
        var json = jsonDecode(response);
        if (request.requestServiceType == RequestServiceType.RegisterBaby) {
          var response = (json["response"]);
           var importSummary = (response["importSummaries"]);
          var importArray=(importSummary[0]);
          String responseKey = (importArray["reference"]);

          //update trackedEntity id
          ChildModel child =
              HiveStorageRepository().getSingleChild(request.key);
          child.trackedEntityID = responseKey;
          HiveStorageRepository().updateChild(child.key, child);
        }
        networkRequests.removeAt(0);
        HiveStorageRepository().storeNetworkRequestList(networkRequests);
      }
    } catch (e) {
      throw e;
    }
  }
}
