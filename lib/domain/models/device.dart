import 'package:equatable/equatable.dart';

class Device extends Equatable {
  final String deviceCode;

  const Device({required this.deviceCode});

  @override
  List<Object> get props => [deviceCode];

  Device copyWith({
    String? deviceCode,
  }) =>
      Device(
        deviceCode: deviceCode ?? this.deviceCode,
      );

  @override
  bool? get stringify => true;
}
