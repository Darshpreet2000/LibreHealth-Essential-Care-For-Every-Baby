// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_5.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage5Adapter extends TypeAdapter<Stage5> {
  @override
  final int typeId = 14;

  @override
  Stage5 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage5()
      ..ecebStage5NormalReassessBabyfordischarge = fields[0] as bool
      ..ecebStage5NormalGiveparentsguidanceforhomecare = fields[1] as bool
      ..isCompleted = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage5 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ecebStage5NormalReassessBabyfordischarge)
      ..writeByte(1)
      ..write(obj.ecebStage5NormalGiveparentsguidanceforhomecare)
      ..writeByte(2)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage5Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
