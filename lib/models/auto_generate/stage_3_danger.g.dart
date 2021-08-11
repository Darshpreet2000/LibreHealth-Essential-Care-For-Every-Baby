// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_3_danger.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage3DangerAdapter extends TypeAdapter<Stage3Danger> {
  @override
  final int typeId = 11;

  @override
  Stage3Danger read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage3Danger()
      ..ecebStage3GiveAntibiotics = fields[0] as bool
      ..ecebStage3SeekAdvancedCare = fields[1] as bool
      ..isCompleted = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage3Danger obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ecebStage3GiveAntibiotics)
      ..writeByte(1)
      ..write(obj.ecebStage3SeekAdvancedCare)
      ..writeByte(2)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage3DangerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
