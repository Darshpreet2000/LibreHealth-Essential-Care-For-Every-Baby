import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/utils/dhis2_config.dart';
part 'auto_generate/child_model.g.dart';

//flutter packages pub run build_runner build
@HiveType(typeId: 3)
class ChildModel {
  @HiveField(0)
  String parent;
  @HiveField(1)
  String ward;
  @HiveField(2)
  int gender;

  @HiveField(3)
  int color;

  @HiveField(4)
  int darkColor;

  @HiveField(5)
  DateTime birthTime;

  @HiveField(6)
  String trackedEntityID;

  @HiveField(7)
  List<Object> assessmentsList = [];

  @HiveField(8)
  String key; //to uniquely store the child

  ChildModel(this.parent, this.ward, this.gender, this.color, this.darkColor,
      this.birthTime, this.trackedEntityID, this.key);

  factory ChildModel.fromJson(dynamic json) {
    var map = HiveStorageRepository().getChildKeysMap();
    String? parent, ward;
    DateTime? birthTime;
    int? color, darkColor, gender;
    String trackedEntityID = json['trackedEntityInstance'];
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
    Random random = new Random();
    String key = (map.containsKey(trackedEntityID)
        ? map[trackedEntityID]
        : random.nextInt(100000000).toString());
    return new ChildModel(parent!, ward!, gender!, color!, darkColor!,
        birthTime!, trackedEntityID, key);
  }
}
