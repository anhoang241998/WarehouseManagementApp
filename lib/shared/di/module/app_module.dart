import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  Box openDeviceTableBox() => Hive.box('device_table');
}
