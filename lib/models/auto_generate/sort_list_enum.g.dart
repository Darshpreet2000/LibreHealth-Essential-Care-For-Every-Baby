// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sort_list_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SortListEnumAdapter extends TypeAdapter<SortListEnum> {
  @override
  final int typeId = 7;

  @override
  SortListEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SortListEnum.time;
      case 1:
        return SortListEnum.status;
      case 2:
        return SortListEnum.location;
      case 3:
        return SortListEnum.none;
      default:
        return SortListEnum.time;
    }
  }

  @override
  void write(BinaryWriter writer, SortListEnum obj) {
    switch (obj) {
      case SortListEnum.time:
        writer.writeByte(0);
        break;
      case SortListEnum.status:
        writer.writeByte(1);
        break;
      case SortListEnum.location:
        writer.writeByte(2);
        break;
      case SortListEnum.none:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortListEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
