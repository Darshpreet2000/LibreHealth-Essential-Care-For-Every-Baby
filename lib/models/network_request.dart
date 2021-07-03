import 'package:hive/hive.dart';
import 'package:newborn_care/models/request_service_type.dart';
import 'package:newborn_care/models/request_type.dart';
part 'auto_generate/network_request.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 1)
class NetworkRequest {
  @HiveField(0)
  RequestType type;
  @HiveField(1)
  String url;
  @HiveField(2)
  String data;
  @HiveField(3)
  Map<String, String> headers;

  @HiveField(4)
  String key;
  @HiveField(5)
  RequestServiceType requestServiceType;
  NetworkRequest(this.type, this.url, this.data, this.headers, this.key,
      this.requestServiceType);
}
