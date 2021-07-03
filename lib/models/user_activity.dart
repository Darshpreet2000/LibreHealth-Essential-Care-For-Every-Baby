import 'package:hive/hive.dart';

part 'user_activity.g.dart';

//flutter packages pub run build_runner build
@HiveType(typeId: 4)
class UserActivity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String id;
  @HiveField(2)
  DateTime dateTime = DateTime.now();
  UserActivity(this.title, this.id);
  UserActivity.fromJson(Map<String, dynamic> json)
      : title = json['displayName'],
        id = json['id'];
}
