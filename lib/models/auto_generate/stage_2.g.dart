// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage2Adapter extends TypeAdapter<Stage2> {
  @override
  final int typeId = 8;

  @override
  Stage2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage2()
      ..ecebWardName = fields[0] as String
      ..ecebStage2PreventDiseaseVitaminK = fields[1] as bool
      ..ecebStage2PreventDiseaseCordCare = fields[2] as bool
      ..ecebStage2PreventDiseaseEyeCare = fields[3] as bool
      ..ecebWeight = fields[4] as double
      ..ecebAssessTemperature = fields[5] as double
      ..ecebStage2AssessExam = fields[6] as bool?
      ..ecebFastBreathing = fields[7] as bool?
      ..ecebChestIndrawing = fields[8] as bool?
      ..ecebIsFeedingProperly = fields[9] as bool?
      ..ecebConvulsions = fields[10] as bool?
      ..ecebSevereJaundice = fields[11] as bool?
      ..isCompleted = fields[12] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage2 obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.ecebWardName)
      ..writeByte(1)
      ..write(obj.ecebStage2PreventDiseaseVitaminK)
      ..writeByte(2)
      ..write(obj.ecebStage2PreventDiseaseCordCare)
      ..writeByte(3)
      ..write(obj.ecebStage2PreventDiseaseEyeCare)
      ..writeByte(4)
      ..write(obj.ecebWeight)
      ..writeByte(5)
      ..write(obj.ecebAssessTemperature)
      ..writeByte(6)
      ..write(obj.ecebStage2AssessExam)
      ..writeByte(7)
      ..write(obj.ecebFastBreathing)
      ..writeByte(8)
      ..write(obj.ecebChestIndrawing)
      ..writeByte(9)
      ..write(obj.ecebIsFeedingProperly)
      ..writeByte(10)
      ..write(obj.ecebConvulsions)
      ..writeByte(11)
      ..write(obj.ecebSevereJaundice)
      ..writeByte(12)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
