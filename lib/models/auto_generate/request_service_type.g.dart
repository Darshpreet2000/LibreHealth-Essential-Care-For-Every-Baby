// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../request_service_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestServiceTypeAdapter extends TypeAdapter<RequestServiceType> {
  @override
  final int typeId = 5;

  @override
  RequestServiceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RequestServiceType.RegisterBaby;
      case 1:
        return RequestServiceType.AddEvent;
      default:
        return RequestServiceType.RegisterBaby;
    }
  }

  @override
  void write(BinaryWriter writer, RequestServiceType obj) {
    switch (obj) {
      case RequestServiceType.RegisterBaby:
        writer.writeByte(0);
        break;
      case RequestServiceType.AddEvent:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestServiceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
