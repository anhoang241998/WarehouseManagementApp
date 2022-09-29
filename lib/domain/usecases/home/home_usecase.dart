import 'package:injectable/injectable.dart';

import '../../models/device_entity.dart';

abstract class HomeUseCase {
  List<DeviceEntity> loadDevices();

  List<DeviceEntity> searchDevices(String deviceCode);
}

@Injectable(as: HomeUseCase)
class HomeUseCaseImpl extends HomeUseCase {
  final List<DeviceEntity> _deviceList = List.generate(
    100,
    (index) => DeviceEntity(deviceCode: '$index'),
  );

  @override
  List<DeviceEntity> loadDevices() => _deviceList;

  @override
  List<DeviceEntity> searchDevices(String deviceCode) {
    if (deviceCode.isEmpty) return _deviceList;
    return _deviceList
        .where((device) => device.deviceCode == deviceCode)
        .toList();
  }
}
