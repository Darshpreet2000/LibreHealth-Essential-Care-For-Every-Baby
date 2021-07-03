import 'package:hive/hive.dart';

part 'auto_generate/request_type.g.dart';

//flutter packages pub run build_runner build
@HiveType(typeId: 2)
enum RequestType {
  @HiveField(0)
  GET,
  @HiveField(1)
  POST
}
