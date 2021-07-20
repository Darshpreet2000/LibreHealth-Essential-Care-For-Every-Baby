import 'package:flutter/material.dart';
import 'package:newborn_care/utils/dhis2_config.dart';

class OnCallDoctorModel {
  String? onCallDoctorName;
  DateTime? onCallDoctorScheduleDate;
  TimeOfDay? onCallDoctorShiftStartTime;
  TimeOfDay? onCallDoctorShiftEndTime;
  String? eventID;

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
          onCallDoctorShiftStartTime =
              TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
          break;
        case DHIS2Config.onCallDoctorShiftEndTime:
          var parts = element['value'].toString().split(":");
          onCallDoctorShiftEndTime =
              TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
          break;
      }
    });
  }
}
