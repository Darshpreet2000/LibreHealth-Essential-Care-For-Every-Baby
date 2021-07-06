import 'package:hive/hive.dart';
import 'package:newborn_care/models/profile.dart';

class HiveStorageRepository {
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
