import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/network/register_baby_api_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';

class RegisterBabyRepositoryImpl {
  Future checkDataEnteredCorrectly(RegisterBabyModel _registerBabyModel) async {
    if (_registerBabyModel.motherName.isEmpty)
      throw Exception(
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .enterMothersName);
    if (_registerBabyModel.wardName.isEmpty)
      throw Exception(
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .enterWardName);
    if (_registerBabyModel.babiesDelivered == null)
      throw Exception(
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .selectBabiesDelivered);
    if (_registerBabyModel.modeOfDelivery == null ||
        (_registerBabyModel.modeOfDelivery == false &&
            _registerBabyModel.modeOfDeliveryName.isEmpty))
      throw Exception(
          AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
              .selectModeOfDelivery);
    int index = 1;
    _registerBabyModel.children.forEach((element) {
      if (element.gender == null)
        throw Exception(
            AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
                .selectGenderForChild(index));
      if (element.skinColorChanges == null)
        throw Exception(
            AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
                .selectSkinColorChangesForChild(index));
      if (element.traumasDuringBirth == null)
        throw Exception(
            AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
                .selectTraumasDuringBirthForChild(index));
      index++;
    });
  }

  Future registerAllBabies(RegisterBabyModel _registerBabyModel,
      NotificationRepository notificationRepository) async {
    //push data to dhis2 using api
    List<BabyDetailsModel> children = _registerBabyModel.children;
    children.forEach((element) async {
      Random random = new Random();
      //generate unique key for each child
      String key = random.nextInt(100000000).toString();
      _registerBabyModel.children = [element];
      //create child to be added in list of child screens
      ChildModel child = new ChildModel(
          _registerBabyModel.motherName,
          _registerBabyModel.wardName,
          element.gender! ? 1 : 0,
          Colors.blue[100]!.value,
          Colors.white.value,
          element.birthDateTime,
          key,
          key);
      //push data using api
      await registerBabyDetails(_registerBabyModel, key);
      //create stage 1 assessmens
      child.assessmentsList.add(Stage1());
      //save to hive storage
      HiveStorageRepository().storeSingleChild(child);
      //add/schedule stage 1 notifications
      await notificationRepository.showStage1Notification(
          key, _registerBabyModel.motherName);
      await notificationRepository.scheduledStage1Notification(
          key, _registerBabyModel.motherName);
    });
    return;
  }

  Future registerBabyDetails(
      RegisterBabyModel _registerBabyModel, String key) async {
    RegisterBabyAPIClient registerBabyAPIClient = new RegisterBabyAPIClient();
    String json = convertToJson(_registerBabyModel);
    registerBabyAPIClient.registerBabyDetailsAsTrackedEntity(json, key);
    return;
  }

  String convertToJson(RegisterBabyModel _registerBabyModel) {
    List<dynamic> res = [];
    for (int i = 0; i < _registerBabyModel.children.length; i++) {
      res.add((_registerBabyModel.toJson(i)));
    }
    return jsonEncode({"trackedEntityInstances": res});
  }
}
