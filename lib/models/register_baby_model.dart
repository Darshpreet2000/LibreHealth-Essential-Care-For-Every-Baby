import 'package:newborn_care/utils/dhis2_config.dart';
import 'package:intl/intl.dart';

class RegisterBabyModel {
  String motherName = "", wardName = "";
  //to hold toggle buttons data
  bool? babiesDelivered, modeOfDelivery;
  //to hold toggle buttons data
  List<BabyDetailsModel> children = [];
  String modeOfDeliveryName = "";
  RegisterBabyModel() {
    babiesDelivered = null;
    modeOfDelivery = null;
    children.add(new BabyDetailsModel());
  }
  Map<String, dynamic> toJson(int index) => {
        "trackedEntityType": DHIS2Config.trackedEntity,
        "orgUnit": DHIS2Config.orgUnit,
        'attributes': [
          {"attribute": DHIS2Config.ecebMotherName, "value": motherName},
          {
            "attribute": DHIS2Config.ecebGender,
            "value": children[index].gender == true ? 1 : 0
          },
          {
            "attribute": DHIS2Config.ecebBabiesDelivered,
            "value": children.length
          },
          {
            "attribute": DHIS2Config.ecebBirthDateTime,
            "value": DateFormat("yyyy-MM-ddTHH:mm")
                .format(children[index].birthDateTime)
          },
          {
            "attribute": DHIS2Config.ecebModeOfDelivery,
            "value": modeOfDeliveryName
          },
          {"attribute": DHIS2Config.teiWardname, "value": wardName},
          {"attribute": DHIS2Config.ecebTeiClassification, "value": 0}
        ],
        "enrollments": [
          {
            "orgUnit": DHIS2Config.orgUnit,
            "program": DHIS2Config.programECEBID,
            "enrollmentDate":
                DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
            "incidentDate":
                DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
            "events": [
              {
                "program": DHIS2Config.programECEBID,
                "orgUnit": DHIS2Config.orgUnit,
                "eventDate":
                    DateFormat("yyyy-MM-ddThh:mm").format(DateTime.now()),
                "status": "COMPLETED",
                "storedBy": "admin",
                "programStage": DHIS2Config.stageRegisteringBabies,
                "dataValues": [
                  {
                    "dataElement": DHIS2Config.ecebWeight,
                    "value": children[index].weight
                  },
                  {
                    "dataElement": DHIS2Config.ecebSkinColorChanges,
                    "value": children[index].skinColorChanges
                  },
                  {
                    "dataElement": DHIS2Config.ecebTraumasDuringBirth,
                    "value": children[index].traumasDuringBirth
                  },
                  {"dataElement": DHIS2Config.ecebWardName, "value": wardName},
                  {
                    "dataElement": DHIS2Config.ecebtraumasDuringBirthNotes,
                    "value": children[index].traumasDuringBirthNotes
                  },
                  {
                    "dataElement": DHIS2Config.ecebskinColorChangesNotes,
                    "value": children[index].skinColorChangesNotes
                  }
                ]
              },
            ]
          }
        ]
      };
}

class BabyDetailsModel {
  //to hold toggle buttons data
  //gender=> true-male, false-female
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
