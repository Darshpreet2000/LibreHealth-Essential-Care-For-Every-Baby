import 'package:hive/hive.dart';
import 'package:newborn_care/models/request_type.dart';
part 'network_request.g.dart';

//flutter packages pub run build_runner build

@HiveType(typeId: 1)
class NetworkRequest {
  @HiveField(0)
  final RequestType type;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String data;
  @HiveField(3)
  final Map<String, String> headers;

  NetworkRequest(this.type, this.url, this.data, this.headers);
}
