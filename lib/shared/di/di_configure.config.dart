// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../data/repositories/device_repository_impl.dart' as _i5;
import '../../domain/repositories/device_repository.dart' as _i4;
import '../../domain/usecases/add_edit_device/add_edit_device_usecase.dart'
    as _i8;
import '../../domain/usecases/home/home_usecase.dart' as _i6;
import '../../presentation/add_edit_device/bloc/add_edit_device_cubit.dart'
    as _i10;
import '../../presentation/home/bloc/home_cubit.dart' as _i9;
import 'module/app_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.Box<dynamic>>(() => appModule.openDeviceTableBox());
  gh.factory<_i4.DeviceRepository>(() => _i5.DeviceRepositoryImpl());
  gh.factory<_i6.HomeUseCase>(
      () => _i6.HomeUseCaseImpl(deviceRepository: get<_i4.DeviceRepository>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => appModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<_i8.AddEditDeviceUseCase>(() => _i8.AddEditDeviceUseCaseImpl(
      deviceRepository: get<_i4.DeviceRepository>()));
  gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(homeUseCase: get<_i6.HomeUseCase>()));
  gh.factory<_i10.AddEditDeviceCubit>(() => _i10.AddEditDeviceCubit(
      addEditDeviceUseCase: get<_i8.AddEditDeviceUseCase>()));
  return get;
}

class _$AppModule extends _i11.AppModule {}
