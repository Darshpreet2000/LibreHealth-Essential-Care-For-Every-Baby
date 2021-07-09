import 'package:hive/hive.dart';

part 'auto_generate/sort_list_enum.g.dart';

@HiveType(typeId: 7)
enum SortListEnum {
  @HiveField(0)
  time,
  @HiveField(1)
  status,
  @HiveField(2)
  location,
  @HiveField(3)
  none
}
