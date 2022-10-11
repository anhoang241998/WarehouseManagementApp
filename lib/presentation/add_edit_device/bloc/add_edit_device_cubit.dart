import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/local/models/device_entity.dart';
import '../../../domain/models/device.dart';
import '../../../domain/usecases/add_edit_device/add_edit_device_usecase.dart';
import '../../../shared/utils/field_utils.dart';

part 'add_edit_device_state.dart';

@injectable
class AddEditDeviceCubit extends Cubit<AddEditDeviceState> {
  final AddEditDeviceUseCase _addEditDeviceUseCase;

  AddEditDeviceCubit({
    required AddEditDeviceUseCase addEditDeviceUseCase,
  })  : _addEditDeviceUseCase = addEditDeviceUseCase,
        super(AddEditDeviceState.initial());

  void addNewDevice({
    required String deviceName,
    required String deviceCode,
    required String floor,
    required String block,
    required String position,
    required String subPosition,
    required String imageUrl,
  }) async {
    try {
      if (!_isFieldsValid(
        deviceName: deviceName,
        deviceCode: deviceCode,
        deviceFloor: floor,
        block: block,
        position: position,
        subPosition: subPosition,
        imageUrl: imageUrl,
      )) {
        return;
      }
      final newDevice = DeviceEntity(
        name: deviceName,
        code: deviceCode,
        floor: floor,
        block: block,
        position: position,
        subPosition: subPosition,
        imageUrl: imageUrl,
        shortLabel: '$block-$floor-$position-$subPosition',
      );
      await _addEditDeviceUseCase.addNewDevice(newDevice);
      emit(state.copyWith(status: AddEditDeviceStatus.added));
    } on Exception catch (_) {
      emit(state.copyWith(
        status: AddEditDeviceStatus.error,
        error: 'Something went wrong. Please try again',
      ));
    }
  }

  void editExistingDevice({
    required Device deviceToUpdate,
    required String deviceName,
    required String deviceCode,
    required String floor,
    required String block,
    required String position,
    required String subPosition,
    required String imageUrl,
  }) async {
    try {
      if (!_isFieldsValid(
        deviceName: deviceName,
        deviceCode: deviceCode,
        deviceFloor: floor,
        block: block,
        position: position,
        subPosition: subPosition,
        imageUrl: imageUrl,
      )) {
        return;
      }
      await _addEditDeviceUseCase.editExistingDevice(
        deviceToUpdate.copyWith(
          name: deviceName,
          code: deviceCode,
          floor: floor,
          block: block,
          position: position,
          subPosition: subPosition,
          imageUrl: imageUrl,
          shortLabel: '$block-$floor-$position-$subPosition',
        ),
      );
      emit(state.copyWith(status: AddEditDeviceStatus.added));
    } on Exception catch (_) {
      emit(state.copyWith(
        status: AddEditDeviceStatus.error,
        error: 'Something went wrong. Please try again',
      ));
    }
  }

  bool _isFieldsValid({
    required String deviceName,
    required String deviceCode,
    required String deviceFloor,
    required String block,
    required String position,
    required String subPosition,
    required String imageUrl,
  }) {
    if (FieldUtils.isEmptyField(deviceName) ||
        FieldUtils.isEmptyField(deviceCode) ||
        FieldUtils.isEmptyField(deviceFloor) ||
        FieldUtils.isEmptyField(imageUrl) ||
        !FieldUtils.isSelectBlock(block) ||
        !FieldUtils.isSelectPosition(position) ||
        !FieldUtils.isSelectFloor(deviceFloor)) {
      emit(state.copyWith(
        status: AddEditDeviceStatus.error,
        error: 'Please fill all required fields.',
      ));
      return false;
    } else {
      return true;
    }
  }
}
