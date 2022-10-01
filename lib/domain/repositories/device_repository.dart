import '../../data/local/models/device_entity.dart';

abstract class DeviceRepository {
  List<DeviceEntity> fetchAllDevice();

  Future<void> addNewDevice(DeviceEntity deviceEntity);

  Future<void> updateDevice(DeviceEntity deviceEntity);

  Future<void> deleteDevice(DeviceEntity deviceEntity);
}
