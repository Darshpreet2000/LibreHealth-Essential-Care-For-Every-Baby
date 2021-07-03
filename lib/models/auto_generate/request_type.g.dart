// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../request_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RequestTypeAdapter extends TypeAdapter<RequestType> {
  @override
  final int typeId = 2;

  @override
  RequestType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RequestType.GET;
      case 1:
        return RequestType.POST;
      default:
        return RequestType.GET;
    }
  }

  @override
  void write(BinaryWriter writer, RequestType obj) {
    switch (obj) {
      case RequestType.GET:
        writer.writeByte(0);
        break;
      case RequestType.POST:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
