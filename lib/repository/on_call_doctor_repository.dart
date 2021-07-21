import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/on_call_doctor_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:http/http.dart' as http;

class OnCallDoctorRepository {
  BuildContext context;
  late OnCallDoctorClient onCallDoctorClient;
  HiveStorageRepository hiveStorageRepository;
  OnCallDoctorRepository(this.context, this.hiveStorageRepository) {
    onCallDoctorClient = OnCallDoctorClient(
      http.Client(),
      context,
    );
  }
  Future getListOfOnCallDoctors() async {
    Profile profile = hiveStorageRepository.getProfile();
    String response = await onCallDoctorClient.fetchOnCallDoctors(
        profile.username, profile.password);
    Map<String, dynamic> res = jsonDecode(response);
    List<OnCallDoctorModel> result = [];
    for (var item in res['events']) {
      OnCallDoctorModel onCallDoctorModel = OnCallDoctorModel.fromJson(item);
      result.add(onCallDoctorModel);
    }
    hiveStorageRepository.saveOnCallDoctors(result);
    return seperateDoctorsOnCall(result);
  }

  List<OnCallDoctorModel> seperateDoctorsOnCall(List<OnCallDoctorModel> list) {
    List<OnCallDoctorModel> doctorsonCall = [];
    list.forEach((element) {
      final currentTime = DateTime.now();

      if (currentTime.isAfter(element.onCallDoctorShiftStartTime!) &&
          currentTime.isBefore(element.onCallDoctorShiftEndTime!)) {
        doctorsonCall.add(element);
      }
    });

    return doctorsonCall;
  }
}
