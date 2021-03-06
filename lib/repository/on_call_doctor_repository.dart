import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/network/message_client.dart';
import 'package:newborn_care/network/on_call_doctor_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:synchronized/synchronized.dart';

class OnCallDoctorRepository {
  BuildContext context;
  Lock lock;
  late OnCallDoctorClient onCallDoctorClient;
  late MessageClient messageClient;
  HiveStorageRepository hiveStorageRepository;
  RefreshRepository refreshRepository;
  OnCallDoctorRepository(this.context, this.lock, this.hiveStorageRepository,
      this.refreshRepository) {
    onCallDoctorClient = OnCallDoctorClient(
      http.Client(),
      context,
    );
    messageClient = new MessageClient(hiveStorageRepository);
  }
  Future sendMessageToDoctor(String userIdOfOtherDoctor) async {
    Profile profile = hiveStorageRepository.getProfile();
    var jsonObject = {
      "subject": AppLocalizations.of(context)!.onCallDoctorAlertMessage +
          ", " +
          AppLocalizations.of(context)!.youHaveBeenAlertedBy(profile.name),
      "users": [
        {"id": "$userIdOfOtherDoctor"},
      ],
    };
    await messageClient.sendMessage(
        jsonEncode(jsonObject), profile.username, profile.password);
    try {
      await lock.synchronized(refreshRepository.startRefreshing);
    } catch (e) {
      throw e;
    }
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
