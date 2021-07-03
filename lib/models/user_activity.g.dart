// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserActivityAdapter extends TypeAdapter<UserActivity> {
  @override
  final int typeId = 4;

  @override
  UserActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserActivity(
      fields[0] as String,
      fields[1] as String,
    )..dateTime = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, UserActivity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
