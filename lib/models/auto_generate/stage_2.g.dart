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
      ..ecebExaminationHead = fields[6] as bool
      ..ecebExaminationGenitalia = fields[7] as bool
      ..ecebExaminationEyes = fields[8] as bool
      ..ecebExaminationAnus = fields[9] as bool
      ..ecebExaminationEarsNoseThroat = fields[10] as bool
      ..ecebExaminationMuscoskeletal = fields[11] as bool
      ..ecebExaminationChest = fields[12] as bool
      ..ecebExaminationNeurology = fields[13] as bool
      ..ecebExaminationCardiovascular = fields[14] as bool
      ..ecebExaminationSkin = fields[15] as bool
      ..ecebExaminationAbdomen = fields[16] as bool
      ..ecebExaminationOverall = fields[17] as bool
      ..ecebFastBreathing = fields[18] as bool?
      ..ecebChestIndrawing = fields[19] as bool?
      ..ecebFeedingProperly = fields[20] as bool?
      ..ecebConvulsions = fields[21] as bool?
      ..ecebSevereJaundice = fields[22] as bool?
      ..isCompleted = fields[23] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage2 obj) {
    writer
      ..writeByte(24)
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
      ..write(obj.ecebExaminationHead)
      ..writeByte(7)
      ..write(obj.ecebExaminationGenitalia)
      ..writeByte(8)
      ..write(obj.ecebExaminationEyes)
      ..writeByte(9)
      ..write(obj.ecebExaminationAnus)
      ..writeByte(10)
      ..write(obj.ecebExaminationEarsNoseThroat)
      ..writeByte(11)
      ..write(obj.ecebExaminationMuscoskeletal)
      ..writeByte(12)
      ..write(obj.ecebExaminationChest)
      ..writeByte(13)
      ..write(obj.ecebExaminationNeurology)
      ..writeByte(14)
      ..write(obj.ecebExaminationCardiovascular)
      ..writeByte(15)
      ..write(obj.ecebExaminationSkin)
      ..writeByte(16)
      ..write(obj.ecebExaminationAbdomen)
      ..writeByte(17)
      ..write(obj.ecebExaminationOverall)
      ..writeByte(18)
      ..write(obj.ecebFastBreathing)
      ..writeByte(19)
      ..write(obj.ecebChestIndrawing)
      ..writeByte(20)
      ..write(obj.ecebFeedingProperly)
      ..writeByte(21)
      ..write(obj.ecebConvulsions)
      ..writeByte(22)
      ..write(obj.ecebSevereJaundice)
      ..writeByte(23)
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
