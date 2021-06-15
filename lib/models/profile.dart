import 'package:hive/hive.dart';
part 'profile.g.dart';

@HiveType(typeId: 0)
class Profile { 
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;

  Profile(this.name, this.id);

}
