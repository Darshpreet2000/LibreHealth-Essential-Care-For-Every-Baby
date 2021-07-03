import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
part 'auto_generate/child_model.g.dart';

//flutter packages pub run build_runner build
@HiveType(typeId: 3)
class ChildModel {
  @HiveField(0)
  final String parent;
  @HiveField(1)
  final String ward;
  @HiveField(2)
  final int gender;

  @HiveField(3)
  final int? color;

  @HiveField(4)
  final int? darkColor;

  @HiveField(5)
  final DateTime birthTime;

  @HiveField(6)
  String trackedEntityID;

  ChildModel(this.parent, this.ward, this.gender, this.color, this.darkColor,
      this.birthTime, this.trackedEntityID);
  factory ChildModel.fromJson(dynamic json) {
    String? parent, ward;
    DateTime? birthTime;
    int? color, darkColor, gender;
    String trackedEntityID = json['trackedEntityType'];
    color = Colors.blue[100]!.value;
    darkColor = Colors.white.value;
    var jsonList = json['attributes'];
    jsonList.forEach((element) {
      switch (element['attribute']) {
        case DHIS2Config.ecebMotherName:
          parent = element['value'];
          break;
        case DHIS2Config.ecebGender:
          gender = int.parse(element['value']);
          break;
        case DHIS2Config.classification:
          if (element['value'].toString() == "Normal") {
            color = Colors.green[100]!.value;
            darkColor = Colors.green[300]!.value;
          } else if (element['value'].toString() == "Problem") {
            color = Colors.yellow[100]!.value;
            darkColor = Colors.yellow[300]!.value;
          } else if (element['value'].toString() == "Danger") {
            color = Colors.red[100]!.value;
            darkColor = Colors.red[300]!.value;
          }
          break;
        case DHIS2Config.ecebBabiesDelivered:
          break;
        case DHIS2Config.ecebBirthDateTime:
          birthTime = DateTime.parse(element['value']);
          break;
        case DHIS2Config.ecebModeOfDelivery:
          break;
        case DHIS2Config.teiWardname:
          ward = element['value'];
          break;
      }
    });
    return new ChildModel(parent!, ward!, gender!, color!, darkColor!,
        birthTime!, trackedEntityID);
  }
}
