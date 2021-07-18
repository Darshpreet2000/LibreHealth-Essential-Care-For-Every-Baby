// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../stage_3_problem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Stage3ProblemAdapter extends TypeAdapter<Stage3Problem> {
  @override
  final int typeId = 10;

  @override
  Stage3Problem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stage3Problem()
      ..ecebStage3ProblemUnder2000gProlongSkinToSkinCare = fields[0] as bool
      ..ecebStage3ProblemAbnormalTemperatureImproveThermalCare =
          fields[1] as bool
      ..ecebStage3ProblemContinueInpatientCare = fields[2] as bool
      ..ecebStage3ProblemPoorFeedingExpressBreastMilk = fields[3] as bool
      ..ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod =
          fields[4] as bool
      ..isCompleted = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, Stage3Problem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.ecebStage3ProblemUnder2000gProlongSkinToSkinCare)
      ..writeByte(1)
      ..write(obj.ecebStage3ProblemAbnormalTemperatureImproveThermalCare)
      ..writeByte(2)
      ..write(obj.ecebStage3ProblemContinueInpatientCare)
      ..writeByte(3)
      ..write(obj.ecebStage3ProblemPoorFeedingExpressBreastMilk)
      ..writeByte(4)
      ..write(obj.ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod)
      ..writeByte(5)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stage3ProblemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
