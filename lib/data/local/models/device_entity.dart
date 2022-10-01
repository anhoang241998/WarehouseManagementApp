import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'device_entity.g.dart';

@HiveType(typeId: 1)
class DeviceEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String deviceCode;

  const DeviceEntity({required this.id, required this.deviceCode});

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [id, deviceCode];

  DeviceEntity copyWith({
    int? id,
    String? deviceCode,
  }) =>
      DeviceEntity(
        id: id ?? this.id,
        deviceCode: deviceCode ?? this.deviceCode,
      );
}
