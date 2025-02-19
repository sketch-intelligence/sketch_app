// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FollowingAdapter extends TypeAdapter<Following> {
  @override
  final int typeId = 6;

  @override
  Following read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Following(
      id: fields[0] as int?,
      name: fields[1] as String?,
      imageUrl: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Following obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
