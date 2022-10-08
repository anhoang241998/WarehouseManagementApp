// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceEntityAdapter extends TypeAdapter<DeviceEntity> {
  @override
  final int typeId = 1;

  @override
  DeviceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceEntity(
      code: fields[0] as String,
      name: fields[1] as String,
      block: fields[2] as String,
      floor: fields[3] as String,
      position: fields[4] as String,
      subPosition: fields[5] as String,
      shortLabel: fields[6] as String,
      isNew: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.block)
      ..writeByte(3)
      ..write(obj.floor)
      ..writeByte(4)
      ..write(obj.position)
      ..writeByte(5)
      ..write(obj.subPosition)
      ..writeByte(6)
      ..write(obj.shortLabel)
      ..writeByte(7)
      ..write(obj.isNew);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
