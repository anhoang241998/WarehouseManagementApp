import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  final String deviceCode;

  const DeviceEntity({required this.deviceCode});

  @override
  List<Object> get props => [deviceCode];

  DeviceEntity copyWith({
    String? deviceCode,
  }) =>
      DeviceEntity(
        deviceCode: deviceCode ?? this.deviceCode,
      );

  @override
  bool? get stringify => true;
}
