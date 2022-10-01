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
import '../../domain/usecases/home/home_usecase.dart' as _i6;
import '../../presentation/home/bloc/home_cubit.dart' as _i8;
import 'module/app_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.HomeCubit>(
      () => _i8.HomeCubit(homeUseCase: get<_i6.HomeUseCase>()));
  return get;
}

class _$AppModule extends _i9.AppModule {}
