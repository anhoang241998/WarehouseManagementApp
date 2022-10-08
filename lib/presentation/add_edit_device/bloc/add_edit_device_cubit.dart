import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/local/models/device_entity.dart';
import '../../../domain/usecases/add_edit_device/add_edit_device_usecase.dart';

part 'add_edit_device_state.dart';

@injectable
class AddEditDeviceCubit extends Cubit<AddEditDeviceState> {
  final AddEditDeviceUseCase _addEditDeviceUseCase;

  AddEditDeviceCubit({
    required AddEditDeviceUseCase addEditDeviceUseCase,
  })  : _addEditDeviceUseCase = addEditDeviceUseCase,
        super(AddEditDeviceState.initial());

  void addNewDevice(String deviceCode) async {
    try {
      final newDevice = DeviceEntity(
        code: deviceCode,
        name: '',
        block: '',
        position: '',
        floor: '',
        subPosition: '',
        shortLabel: '',
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
}
