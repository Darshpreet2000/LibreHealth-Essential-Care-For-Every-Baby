// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkRequestAdapter extends TypeAdapter<NetworkRequest> {
  @override
  final int typeId = 1;

  @override
  NetworkRequest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetworkRequest(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as Map).cast<String, String>(),
      fields[3] as String,
      fields[4] as RequestServiceType,
    );
  }

  @override
  void write(BinaryWriter writer, NetworkRequest obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.headers)
      ..writeByte(3)
      ..write(obj.key)
      ..writeByte(4)
      ..write(obj.requestServiceType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkRequestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
