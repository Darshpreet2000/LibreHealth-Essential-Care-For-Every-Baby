// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_3_normal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage3NormalAdapter extends TypeAdapter<Stage3Normal> {
  @override
  final int typeId = 9;

  @override
  Stage3Normal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage3Normal()
      ..ecebStage3NormalMaintainNormalTemperature = fields[0] as bool
      ..ecebStage3NormalSupportBreastfeeding = fields[1] as bool
      ..ecebStage3NormalAdviseAboutBreastFeedingProblems = fields[2] as bool
      ..ecebStage3NormalImmunize = fields[3] as bool
      ..isCompleted = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage3Normal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ecebStage3NormalMaintainNormalTemperature)
      ..writeByte(1)
      ..write(obj.ecebStage3NormalSupportBreastfeeding)
      ..writeByte(2)
      ..write(obj.ecebStage3NormalAdviseAboutBreastFeedingProblems)
      ..writeByte(3)
      ..write(obj.ecebStage3NormalImmunize)
      ..writeByte(4)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage3NormalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
