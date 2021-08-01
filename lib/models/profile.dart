import 'package:hive/hive.dart';
part 'auto_generate/profile.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 0)
class Profile {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String avatarID;

  Profile(this.name, this.id, this.username, this.password, this.avatarID);
}
