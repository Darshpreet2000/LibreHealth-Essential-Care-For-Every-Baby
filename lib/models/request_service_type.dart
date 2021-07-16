import 'package:hive/hive.dart';
part 'auto_generate/request_service_type.g.dart';

@HiveType(typeId: 5)
enum RequestServiceType {
  @HiveField(0)
  registerBaby,
  @HiveField(1)
  addEvent
}
