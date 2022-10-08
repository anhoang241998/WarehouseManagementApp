import 'package:injectable/injectable.dart';

import '../../../data/local/models/device_entity.dart';
import '../../repositories/device_repository.dart';

abstract class AddEditDeviceUseCase {
  Future<void> addNewDevice(DeviceEntity newDevice);
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
}
