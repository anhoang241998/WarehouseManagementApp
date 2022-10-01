// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../data/repositories/device_repository_impl.dart' as _i4;
import '../../domain/repositories/device_repository.dart' as _i3;
import '../../domain/usecases/home/home_usecase.dart' as _i5;
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
  gh.factory<_i3.DeviceRepository>(() => _i4.DeviceRepositoryImpl());
  gh.factory<_i5.HomeUseCase>(
      () => _i5.HomeUseCaseImpl(deviceRepository: get<_i3.DeviceRepository>()));
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => appModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => appModule.deviceTableName,
    instanceName: 'device_table_name',
  );
  gh.factory<_i7.Box<dynamic>>(() => appModule
      .openDeviceTableBox(get<String>(instanceName: 'device_table_name')));
  gh.factory<_i8.HomeCubit>(
      () => _i8.HomeCubit(homeUseCase: get<_i5.HomeUseCase>()));
  return get;
}

class _$AppModule extends _i9.AppModule {}
