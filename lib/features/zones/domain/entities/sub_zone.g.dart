// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_zone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubZoneAdapter extends TypeAdapter<SubZone> {
  @override
  final int typeId = 1;

  @override
  SubZone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubZone(
      id: fields[0] as int?,
      name: fields[1] as String?,
      mainZoneName: fields[3] as String?,
      mainZoneId: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SubZone obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.mainZoneName)
      ..writeByte(4)
      ..write(obj.mainZoneId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubZoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
