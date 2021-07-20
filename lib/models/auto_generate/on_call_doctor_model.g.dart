// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../on_call_doctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OnCallDoctorModelAdapter extends TypeAdapter<OnCallDoctorModel> {
  @override
  final int typeId = 13;

  @override
  OnCallDoctorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OnCallDoctorModel(
      fields[0] as String?,
      fields[1] as DateTime?,
      fields[2] as DateTime?,
      fields[3] as DateTime?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OnCallDoctorModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.onCallDoctorName)
      ..writeByte(1)
      ..write(obj.onCallDoctorScheduleDate)
      ..writeByte(2)
      ..write(obj.onCallDoctorShiftStartTime)
      ..writeByte(3)
      ..write(obj.onCallDoctorShiftEndTime)
      ..writeByte(4)
      ..write(obj.eventID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnCallDoctorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
