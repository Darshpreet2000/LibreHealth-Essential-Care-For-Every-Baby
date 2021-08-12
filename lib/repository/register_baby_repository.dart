import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/network/register_baby_api_client.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';

class RegisterBabyRepositoryImpl {
  final BuildContext context;
  late RegisterBabyAPIClient registerBabyAPIClient;
  final HiveStorageRepository hiveStorageRepository;

  RegisterBabyRepositoryImpl(this.context, this.hiveStorageRepository) {
    registerBabyAPIClient = new RegisterBabyAPIClient(hiveStorageRepository);
  }
  RegisterBabyRepositoryImpl.test(
      this.context, this.hiveStorageRepository, this.registerBabyAPIClient);

  Future checkDataEnteredCorrectly(RegisterBabyModel _registerBabyModel) async {
    if (_registerBabyModel.motherName.isEmpty)
      throw Exception(AppLocalizations.of(context)!.enterMothersName);
    if (_registerBabyModel.wardName.isEmpty)
      throw Exception(AppLocalizations.of(context)!.enterWardName);
    if (_registerBabyModel.babiesDelivered == null)
      throw Exception(AppLocalizations.of(context)!.selectBabiesDelivered);
    if (_registerBabyModel.modeOfDelivery == null ||
        (_registerBabyModel.modeOfDeliveryName.isEmpty))
      throw Exception(AppLocalizations.of(context)!.selectModeOfDelivery);
    int index = 1;
    _registerBabyModel.children.forEach((element) {
      if (element.gender == null)
        throw Exception(
            AppLocalizations.of(context)!.selectGenderForChild(index));
      if (element.skinColorChanges == null)
        throw Exception(AppLocalizations.of(context)!
            .selectSkinColorChangesForChild(index));
      if (element.traumasDuringBirth == null)
        throw Exception(AppLocalizations.of(context)!
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
          Colors.blue[50]!.value,
          Colors.white.value,
          element.birthDateTime,
          key,
          key,
          'None',
          key,
          false);
      //push data using api
      await registerBabyDetails(_registerBabyModel, key);
      //create stage 1 assessmens
      child.assessmentsList.add(Stage1());
      //save to hive storage
      hiveStorageRepository.storeSingleChild(child);
      //add/schedule stage 1 notifications
      await notificationRepository.immediateNotification(key,
          _registerBabyModel.motherName, AppLocalizations.of(context)!.phase1);

      await notificationRepository.scheduledStageNotificationReminder(
          key,
          _registerBabyModel.motherName,
          AppLocalizations.of(context)!.phase1,
          child.birthTime.add(Duration(minutes: 60)));
    });
    return;
  }

  Future registerBabyDetails(
      RegisterBabyModel _registerBabyModel, String key) async {
    String json = convertToJson(_registerBabyModel);
    Profile profile = hiveStorageRepository.getProfile();
    registerBabyAPIClient.registerBabyDetailsAsTrackedEntity(
        json, key, profile.username, profile.password);
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
