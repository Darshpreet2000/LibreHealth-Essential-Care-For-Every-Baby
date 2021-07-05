import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/user_activity.dart';

class HiveStorageRepository {
  //List of child

  void storeSingleChild(ChildModel child) {
    mapBox.put(child.key, child);
  }

  Future<void> storeListOfChild(List<ChildModel> childList) async {
    await mapBox.clear();
    childList.forEach((element) {
      mapBox.put(element.key, element);
    });
    print(mapBox.keys);
  }

  void updateChild(String key, ChildModel childModel) {
    mapBox.put(key, childModel);
  }

  ChildModel getSingleChild(String key) {
    print(mapBox.keys);
    return mapBox.get(key)!;
  }

  List<ChildModel> getListOfAllChild() {
    return mapBox.values.toList();
  }

  //User Activity Notification
  void storeNotifications(List<UserActivity> notificationsList) {
    listBox.put('listOfNotifications', notificationsList);
  }

  List<UserActivity> getNotificationsList() {
    if (listBox.containsKey('listOfNotifications')) {
      return listBox.get('listOfNotifications')!.cast<UserActivity>();
    }
    return [];
  }

  // Hive Storage Network Queue
  void storeNetworkRequest(NetworkRequest request) {
    List<NetworkRequest> networkRequests = [];
    if (listBox.containsKey('networkRequest'))
      networkRequests = listBox.get('networkRequest')!.cast<NetworkRequest>();
    networkRequests.add(request);
    listBox.put('networkRequest', networkRequests);
  }

  void storeNetworkRequestList(List<NetworkRequest> networkRequests) {
    listBox.put('networkRequest', networkRequests);
  }

  List<NetworkRequest> getNetworkRequests() {
    List<NetworkRequest> networkRequests = [];
    print(listBox.keys);
    if (listBox.containsKey('networkRequest'))
      return listBox.get('networkRequest')!.cast<NetworkRequest>();

    return networkRequests;
  }

  //Profile
  void storeProfile(Profile profile) {
    box.put("user", profile);
    markUserAsLoggedIn();
  }

  Profile getProfile() {
    return box.get('user');
  }

  void markUserAsLoggedIn() {
    box.put('userLoggedIn', true);
  }

  void markUserAsLoggedOut() {
    box.put('userLoggedIn', false);
  }

  //Check User Logged In
  bool checkUserLoggedIn() {
    if (box.containsKey('userLoggedIn') && box.get('userLoggedIn') == true)
      return true;

    return false;
  }
}
