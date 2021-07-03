import 'dart:convert';

import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/network/register_baby_api_client.dart';

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
