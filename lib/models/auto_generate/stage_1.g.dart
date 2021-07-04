// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage1Adapter extends TypeAdapter<Stage1> {
  @override
  final int typeId = 6;

  @override
  Stage1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage1()
      ..ecebStage1InitiateBreastfeeding = fields[0] as bool?
      ..ecebStage1MonitorBreathing = fields[1] as bool?
      ..ecebStage1SkinToSkinCare = fields[2] as bool?
      ..ecebWardName = fields[3] as String
      ..isCompleted = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage1 obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ecebStage1InitiateBreastfeeding)
      ..writeByte(1)
      ..write(obj.ecebStage1MonitorBreathing)
      ..writeByte(2)
      ..write(obj.ecebStage1SkinToSkinCare)
      ..writeByte(3)
      ..write(obj.ecebWardName)
      ..writeByte(4)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
