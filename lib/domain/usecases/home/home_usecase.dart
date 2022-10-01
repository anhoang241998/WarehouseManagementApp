import 'package:injectable/injectable.dart';

import '../../../data/local/models/device_entity.dart';
import '../../models/device.dart';
import '../../repositories/device_repository.dart';

abstract class HomeUseCase {
  List<Device> loadDevices();

  List<Device> searchDevices(String codeToSearch);

  Future<void> addNewDevice(DeviceEntity newDevice);
}

/// `HomeUseCaseImpl` is a class that implements `HomeUseCase` and provides a list
/// of devices
@Injectable(as: HomeUseCase)
class HomeUseCaseImpl extends HomeUseCase {
  final DeviceRepository _deviceRepository;

  HomeUseCaseImpl({
    required DeviceRepository deviceRepository,
  }) : _deviceRepository = deviceRepository;

  @override
  List<Device> loadDevices() => _deviceRepository
      .fetchAllDevice()
      .map((deviceEntity) => Device(deviceCode: deviceEntity.deviceCode))
      .toList();

  @override
  List<Device> searchDevices(String codeToSearch) {
    final deviceList = loadDevices();
    if (codeToSearch.isEmpty) return deviceList;
    return deviceList.where((device) {
      final code = device.deviceCode.replaceAll(' ', '').toLowerCase();
      return code.contains(codeToSearch.replaceAll(' ', '').toLowerCase());
    }).toList();
  }

  @override
  Future<void> addNewDevice(DeviceEntity newDevice) async {
    await _deviceRepository.addNewDevice(newDevice);
  }
}
