import 'package:hive/hive.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
part 'auto_generate/on_call_doctor_model.g.dart';

@HiveType(typeId: 13)
class OnCallDoctorModel {
  @HiveField(0)
  String? onCallDoctorName;
  @HiveField(1)
  DateTime? onCallDoctorScheduleDate;
  @HiveField(2)
  DateTime? onCallDoctorShiftStartTime;
  @HiveField(3)
  DateTime? onCallDoctorShiftEndTime;
  @HiveField(4)
  String? eventID;
  @HiveField(5)
  String? doctorID;

  OnCallDoctorModel(
      this.onCallDoctorName,
      this.onCallDoctorScheduleDate,
      this.onCallDoctorShiftStartTime,
      this.onCallDoctorShiftEndTime,
      this.eventID);

  OnCallDoctorModel.fromJson(dynamic json) {
    eventID = json['event'];
    var jsonList = json['dataValues'];

    jsonList.forEach((element) {
      switch (element['dataElement']) {
        case DHIS2Config.onCallDoctorName:
          onCallDoctorName = element['value'];
          break;
        case DHIS2Config.onCallDoctorScheduleDate:
          onCallDoctorScheduleDate = DateTime.parse(element['value']);
          break;
        case DHIS2Config.onCallDoctorShiftStartTime:
          var parts = element['value'].toString().split(":");
          onCallDoctorShiftStartTime = DateTime(
              onCallDoctorScheduleDate!.year,
              onCallDoctorScheduleDate!.month,
              onCallDoctorScheduleDate!.day,
              int.parse(parts[0]),
              int.parse(parts[1]));
          break;
        case DHIS2Config.onCallDoctorShiftEndTime:
          var parts = element['value'].toString().split(":");
          onCallDoctorShiftEndTime = DateTime(
              onCallDoctorScheduleDate!.year,
              onCallDoctorScheduleDate!.month,
              onCallDoctorScheduleDate!.day,
              int.parse(parts[0]),
              int.parse(parts[1]));
          break;
        case DHIS2Config.onCallDoctorID:
          doctorID = element['value'];
          break;
      }
    });
  }
}
