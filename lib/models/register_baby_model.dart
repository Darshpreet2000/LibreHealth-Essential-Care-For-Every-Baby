class RegisterBabyModel {
  String? motherName, wardName;
  //to hold toggle buttons data
  bool? babiesDelivered, modeOfDelivery;
  //to hold toggle buttons data
  List<BabyDetailsModel> children = [];
  String? modeOfDeliveryName;
  RegisterBabyModel() {
    babiesDelivered = null;
    modeOfDelivery = null;
    children.add(new BabyDetailsModel());
    wardName = "";
    motherName = "";
    modeOfDeliveryName = "";
  }
}

class BabyDetailsModel {
  //to hold toggle buttons data
  bool? gender, skinColorChanges, traumasDuringBirth;
  //to hold toggle buttons data
  double? weight;
  DateTime birthDateTime = DateTime.now();
  String? skinColorChangesNotes, traumasDuringBirthNotes;
  BabyDetailsModel() {
    //assigning them as null to initialize
    gender = null;
    skinColorChanges = null;
    traumasDuringBirth = null;
    //assigning them as null to initialize

    weight = 1000.0;
    traumasDuringBirthNotes = "";
    skinColorChangesNotes = "";
  }
}
