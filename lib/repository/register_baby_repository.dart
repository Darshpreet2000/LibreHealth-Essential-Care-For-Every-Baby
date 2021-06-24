import 'package:newborn_care/main.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterBabyRepositoryImpl {
  Future checkDataEnteredCorrectly(RegisterBabyModel _registerBabyModel) async {
  
    if (_registerBabyModel.motherName!.isEmpty)
      throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.enterMothersName);
    if (_registerBabyModel.wardName!.isEmpty)
      throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.enterWardName);
    if (_registerBabyModel.babiesDelivered == null)
      throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.selectBabiesDelivered);
    if (_registerBabyModel.modeOfDelivery == null)
      throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.selectModeOfDelivery);
    int index = 1;
    _registerBabyModel.children.forEach((element) {
      if (element.gender == null)
        throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.selectGenderForChild(index));
      if (element.skinColorChanges == null)
        throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.selectSkinColorChangesForChild(index));
      if (element.traumasDuringBirth == null)
        throw Exception(AppLocalizations.of(drawerKey!.currentContext!)!.selectTraumasDuringBirthForChild(index));
      index++;
    });
  }

 
}
