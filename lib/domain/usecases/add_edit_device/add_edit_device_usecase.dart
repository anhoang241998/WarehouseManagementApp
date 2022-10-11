import 'package:injectable/injectable.dart';

import '../../../data/local/models/device_entity.dart';
import '../../models/device.dart';
import '../../repositories/device_repository.dart';

abstract class AddEditDeviceUseCase {
  Future<void> addNewDevice(DeviceEntity newDevice);

  Future<void> editExistingDevice(Device deviceToEdit);
}

@Injectable(as: AddEditDeviceUseCase)
class AddEditDeviceUseCaseImpl extends AddEditDeviceUseCase {
  final DeviceRepository _deviceRepository;

  AddEditDeviceUseCaseImpl({
    required DeviceRepository deviceRepository,
  }) : _deviceRepository = deviceRepository;

  @override
  Future<void> addNewDevice(DeviceEntity newDevice) async {
    await _deviceRepository.addNewDevice(newDevice);
  }

  @override
  Future<void> editExistingDevice(Device deviceToEdit) async {
    final deviceList = _deviceRepository.fetchAllDevice();
    final device = deviceList.firstWhere(
      (device) => device.key as int == deviceToEdit.id,
    );
    final updatedDevice = device.copyWith(
      name: deviceToEdit.name,
      code: deviceToEdit.code,
      floor: deviceToEdit.floor,
      block: deviceToEdit.block,
      position: deviceToEdit.position,
      subPosition: deviceToEdit.subPosition,
      imageUrl: deviceToEdit.imageUrl,
      isNew: false,
    );
    await _deviceRepository.updateDevice(deviceToEdit.id, updatedDevice);
  }
}
