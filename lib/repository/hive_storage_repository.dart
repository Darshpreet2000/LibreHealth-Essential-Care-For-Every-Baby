import 'package:hive/hive.dart';
import 'package:newborn_care/models/network_request.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/user_activity.dart';

class HiveStorageRepository {
  //User Activity Notification
  void storeNotifications(List<UserActivity> notificationsList) {
    Box<List> listBox = Hive.box<List>('eceblist');
    listBox.put('listOfNotifications', notificationsList);
  }

  List<UserActivity> getNotificationsList() {
    Box<List> listBox = Hive.box<List>('eceblist');
    if (listBox.containsKey('listOfNotifications')) {
      return listBox.get('listOfNotifications')!.cast<UserActivity>();
    }
    return [];
  }

  // Hive Storage Network Queue
  void storeNetworkRequest(NetworkRequest request) {
    Box<List> listBox = Hive.box<List>('eceblist');
    List<NetworkRequest> networkRequests = [];
    if (listBox.containsKey('networkRequest'))
      networkRequests = listBox.get('networkRequest')!.cast<NetworkRequest>();
    networkRequests.add(request);
    listBox.put('networkRequest', networkRequests);
  }

  void storeNetworkRequestList(List<NetworkRequest> networkRequests) {
    Box<List> listBox = Hive.box<List>('eceblist');
    listBox.put('networkRequest', networkRequests);
  }

  List<NetworkRequest> getNetworkRequests() {
    Box<List> listBox = Hive.box<List>('eceblist');
    List<NetworkRequest> networkRequests = [];
    print(listBox.keys);
    if (listBox.containsKey('networkRequest'))
      return listBox.get('networkRequest')!.cast<NetworkRequest>();

    return networkRequests;
  }

  //Profile
  void storeProfile(Profile profile) {
    var box = Hive.box('eceb');
    box.put("user", profile);
    markUserAsLoggedIn();
  }

  Profile getProfile() {
    var box = Hive.box('eceb');
    return box.get('user');
  }

  void markUserAsLoggedIn() {
    var box = Hive.box('eceb');
    box.put('userLoggedIn', true);
  }

  void markUserAsLoggedOut() {
    var box = Hive.box('eceb');
    box.put('userLoggedIn', false);
  }

  //Check User Logged In
  bool checkUserLoggedIn() {
    var box = Hive.box('eceb');
    if (box.containsKey('userLoggedIn') && box.get('userLoggedIn') == true)
      return true;

    return false;
  }
}
