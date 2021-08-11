// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_4.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage4Adapter extends TypeAdapter<Stage4> {
  @override
  final int typeId = 12;

  @override
  Stage4 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage4()
      ..ecebWeight = fields[0] as double
      ..ecebAssessTemperature = fields[1] as double
      ..ecebFastBreathing = fields[2] as bool?
      ..ecebFeedingProperly = fields[3] as bool?
      ..ecebSevereJaundice = fields[4] as bool?
      ..ecebChestIndrawing = fields[5] as bool?
      ..ecebConvulsions = fields[6] as bool?
      ..isCompleted = fields[7] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage4 obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ecebWeight)
      ..writeByte(1)
      ..write(obj.ecebAssessTemperature)
      ..writeByte(2)
      ..write(obj.ecebFastBreathing)
      ..writeByte(3)
      ..write(obj.ecebFeedingProperly)
      ..writeByte(4)
      ..write(obj.ecebSevereJaundice)
      ..writeByte(5)
      ..write(obj.ecebChestIndrawing)
      ..writeByte(6)
      ..write(obj.ecebConvulsions)
      ..writeByte(7)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage4Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
