import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/local/models/device_entity.dart';
import '../../../domain/models/device.dart';
import '../../../domain/usecases/home/home_usecase.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit({required HomeUseCase homeUseCase})
      : _homeUseCase = homeUseCase,
        super(HomeState.initial());

  void loadListOfDevice() {
    final deviceList = _homeUseCase.loadDevices();
    emit(state.copyWith(status: HomeStatus.loaded, deviceList: deviceList));
  }

  void searchDevice(String codeToSearch) {
    final deviceList = _homeUseCase.searchDevices(codeToSearch);
    emit(state.copyWith(status: HomeStatus.loaded, deviceList: deviceList));
  }

  void addNewDevice() {
    const newDevice = DeviceEntity(id: 1, deviceCode: 'SM-02');
    _homeUseCase.addNewDevice(newDevice);
    final deviceList = _homeUseCase.loadDevices();
    emit(state.copyWith(status: HomeStatus.loaded, deviceList: deviceList));
  }
}
