import 'package:hive/hive.dart';
import 'package:newborn_care/models/request_service_type.dart';
part 'auto_generate/network_request.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 1)
class NetworkRequest {
  @HiveField(0)
  String url;
  @HiveField(1)
  String data;
  @HiveField(2)
  Map<String, String> headers;

  @HiveField(3)
  String key;
  @HiveField(4)
  RequestServiceType requestServiceType;
  NetworkRequest(
      this.url, this.data, this.headers, this.key, this.requestServiceType);
}
