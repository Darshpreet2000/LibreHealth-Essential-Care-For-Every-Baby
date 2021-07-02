import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/network/refresh_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

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
      while (networkRequests.isNotEmpty) {
        NetworkRequest request = networkRequests.first;

        await RefreshClient(http.Client(), m).doNetworkRequest(request);
        networkRequests.removeAt(0);
        HiveStorageRepository().storeNetworkRequestList(networkRequests);
      }
    } catch (e) {
      throw e;
    }
  }
}
