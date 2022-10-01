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
      deviceBox.values.toList().cast<DeviceEntity>();

  @override
  Future<void> addNewDevice(DeviceEntity deviceEntity) async =>
      await deviceBox.put(deviceEntity.id, deviceEntity);

  @override
  Future<void> updateDevice(DeviceEntity deviceEntity) async =>
      await deviceBox.put(deviceEntity.id, deviceEntity);

  @override
  Future<void> deleteDevice(DeviceEntity deviceEntity) async =>
      await deviceBox.delete(deviceEntity.id);
}
