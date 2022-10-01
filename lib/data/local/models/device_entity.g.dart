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
      id: fields[0] as int,
      deviceCode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.deviceCode);
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
