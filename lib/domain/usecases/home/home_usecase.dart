import 'package:injectable/injectable.dart';

import '../../models/device.dart';
import '../../repositories/device_repository.dart';

abstract class HomeUseCase {
  List<Device> loadDevices();

  List<Device> searchDevices(String codeToSearch);

  Future<void> updateUnseenDevice(Device deviceToUpdate);

  Future<void> deleteDevice(Device deviceToDelete);
}

/// `HomeUseCaseImpl` is a class that implements `HomeUseCase` and provides a list
/// of devices
@Injectable(as: HomeUseCase)
class HomeUseCaseImpl extends HomeUseCase {
  final DeviceRepository _deviceRepository;

  HomeUseCaseImpl({
    required DeviceRepository deviceRepository,
  }) : _deviceRepository = deviceRepository;

  /// It fetches all the devices from the database and converts them into a list of
  /// Device objects.
  @override
  List<Device> loadDevices() => _deviceRepository
      .fetchAllDevice()
      .map(
        (deviceEntity) => Device(
          id: deviceEntity.key as int,
          code: deviceEntity.code,
          name: deviceEntity.name,
          block: deviceEntity.block,
          floor: deviceEntity.floor,
          position: deviceEntity.position,
          subPosition: deviceEntity.subPosition,
          shortLabel: deviceEntity.shortLabel,
          imageUrl: deviceEntity.imageUrl,
          isNew: deviceEntity.isNew,
        ),
      )
      .toList();

  /// > It takes a list of devices, and returns a list of devices that match the
  /// search criteria
  ///
  /// Args:
  ///   codeToSearch (String): The code to search for.
  ///
  /// Returns:
  ///   A list of devices that match the search criteria.
  @override
  List<Device> searchDevices(String codeToSearch) {
    final deviceList = loadDevices();
    if (codeToSearch.isEmpty) return deviceList;
    return deviceList.where((device) {
      final code = device.code.replaceAll(' ', '').toLowerCase();
      return code.contains(codeToSearch.replaceAll(' ', '').toLowerCase());
    }).toList();
  }

  /// It deletes a device from the device repository.
  ///
  /// Args:
  ///   deviceToDelete (Device): The device to be deleted.
  @override
  Future<void> deleteDevice(Device deviceToDelete) async {
    final deviceList = _deviceRepository.fetchAllDevice();
    final device =
        deviceList.firstWhere((device) => device.code == deviceToDelete.code);
    await _deviceRepository.deleteDevice(device);
  }

  /// > It fetches all the devices from the repository, finds the device with the
  /// same id as the one passed in, and updates the isNew property of that device
  ///
  /// Args:
  ///   deviceToUpdate (Device): The device that needs to be updated.
  @override
  Future<void> updateUnseenDevice(Device deviceToUpdate) async {
    final deviceList = _deviceRepository.fetchAllDevice();
    final device =
        deviceList.firstWhere((device) => device.code == deviceToUpdate.code);
    final updatedDevice = device.copyWith(isNew: deviceToUpdate.isNew);
    await _deviceRepository.updateDevice(device.key as int, updatedDevice);
  }
}
