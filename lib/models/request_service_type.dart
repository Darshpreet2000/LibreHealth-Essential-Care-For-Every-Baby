import 'package:hive/hive.dart';
part 'request_service_type.g.dart';

@HiveType(typeId: 5)
enum RequestServiceType {
  @HiveField(0)
  registerBaby,
  @HiveField(1)
  addEvent,
  @HiveField(2)
  updateRequest,
  @HiveField(3)
  sendMessage,
  @HiveField(4)
  updateEnrollmentStatusRequest
}
