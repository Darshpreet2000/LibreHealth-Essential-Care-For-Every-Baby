import 'package:hive/hive.dart';
import 'package:newborn_care/models/profile.dart';

class HiveStorageRepository {
  //Profile
  void storeProfile(Profile profile) {
    var box = Hive.box('eceb');
    box.put("userId", profile.id);
    box.put("userName", profile.name);
    markUserAsLoggedIn();
  }

  Profile getProfile() {
    var box = Hive.box('eceb');
    return Profile(box.get("userName"), box.get("userId"));
  }

  void markUserAsLoggedIn() {
    var box = Hive.box('eceb');
    box.put('userLoggedIn', true);
  }

  void markUserAsLoggedOut() {
    var box = Hive.box('eceb');
    box.put('userLoggedIn', false);
  }
}
