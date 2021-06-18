import 'package:hive/hive.dart';
import 'package:newborn_care/models/profile.dart';

class HiveStorageRepository {
  //Profile
  void storeProfile(Profile profile) {
    var box = Hive.box('eceb');
    box.put("id", profile.id);
    box.put("name", profile.name);
    box.put("username", profile.username);
    box.put("password", profile.password);
    markUserAsLoggedIn();
  }

  Profile getProfile() {
    var box = Hive.box('eceb');
    return Profile(box.get("name"), box.get("id"), box.get("username"),
        box.get("password"));
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
