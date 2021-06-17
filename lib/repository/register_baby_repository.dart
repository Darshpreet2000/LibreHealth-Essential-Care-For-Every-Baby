import 'package:newborn_care/models/register_baby_model.dart'; 

class RegisterBabyRepositoryImpl {
  Future checkDataEnteredCorrectly(RegisterBabyModel _registerBabyModel) async {
    if (_registerBabyModel.motherName!.isEmpty)
      throw Exception("Enter Mother's name");
    if (_registerBabyModel.wardName!.isEmpty)
      throw Exception("Enter Ward name");
    if (_registerBabyModel.babiesDelivered==null) throw Exception("Select babies delivered");
    if (_registerBabyModel.modeOfDelivery==null) throw Exception("Select mode of delivery");
    int index = 1;
    _registerBabyModel.children.forEach((element) {
      if (element.gender==null)
        throw Exception("Select gender for child $index");
      if (element.skinColorChanges==null)
        throw Exception("Select skin color changes for child $index");
      if (element.traumasDuringBirth==null)
        throw Exception("Select traumas during birth for child $index");
      index++;
    });
  }

 
}
