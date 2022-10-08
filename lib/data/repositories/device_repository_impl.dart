import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/device_repository.dart';
import '../../shared/di/di_configure.dart';
import '../local/models/device_entity.dart';

@Injectable(as: DeviceRepository)
class DeviceRepositoryImpl extends DeviceRepository {
  final Box deviceBox = getIt<Box>();

  @override
  List<DeviceEntity> fetchAllDevice() =>
      deviceBox.values.toList().cast<DeviceEntity>().reversed.toList();

  @override
  Future<void> addNewDevice(DeviceEntity deviceEntity) async =>
      await deviceBox.add(deviceEntity);

  @override
  Future<void> updateDevice(int key, DeviceEntity deviceEntity) async {
    await deviceBox.put(key, deviceEntity);
  }

  @override
  Future<void> deleteDevice(DeviceEntity deviceEntity) async =>
      await deviceBox.delete(deviceEntity.key);
}
