// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../child_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChildModelAdapter extends TypeAdapter<ChildModel> {
  @override
  final int typeId = 3;

  @override
  ChildModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChildModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      fields[5] as DateTime,
      fields[6] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as bool,
    )..assessmentsList = (fields[7] as List).cast<Object>();
  }

  @override
  void write(BinaryWriter writer, ChildModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.parent)
      ..writeByte(1)
      ..write(obj.ward)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.darkColor)
      ..writeByte(5)
      ..write(obj.birthTime)
      ..writeByte(6)
      ..write(obj.trackedEntityID)
      ..writeByte(7)
      ..write(obj.assessmentsList)
      ..writeByte(8)
      ..write(obj.key)
      ..writeByte(9)
      ..write(obj.classification)
      ..writeByte(10)
      ..write(obj.enrollmentID)
      ..writeByte(11)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
