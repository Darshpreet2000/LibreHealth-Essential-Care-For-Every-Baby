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
        return RequestServiceType.registerBaby;
      case 1:
        return RequestServiceType.addEvent;
      default:
        return RequestServiceType.registerBaby;
    }
  }

  @override
  void write(BinaryWriter writer, RequestServiceType obj) {
    switch (obj) {
      case RequestServiceType.registerBaby:
        writer.writeByte(0);
        break;
      case RequestServiceType.addEvent:
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
