import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @Named('device_table_name')
  String get deviceTableName => 'device_table';

  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  Box openDeviceTableBox(@Named('device_table_name') String name) =>
      Hive.box(name);
}
