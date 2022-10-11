import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/local/models/device_entity.dart';
import 'presentation/setting/bloc/setting_cubit.dart';
import 'shared/di/di_configure.dart';
import 'shared/routes/app_route.dart';

void main() async {
  await _initApp();
  runApp(const MyApp());
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceEntityAdapter());
  await Hive.openBox('device_table');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<SettingCubit>(
        create: (context) => getIt<SettingCubit>(),
        child: const WareHouseApp(),
      );
}

class WareHouseApp extends StatelessWidget {
  const WareHouseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) => ScreenUtilInit(
          minTextAdapt: true,
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light().copyWith(
                    dividerColor: Colors.transparent,
                    appBarTheme: const AppBarTheme(
                      color: Colors.greenAccent,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ThemeData.dark().copyWith(dividerColor: Colors.transparent),
            onGenerateRoute: AppRoute.generateRoute,
          ),
        ),
      );
}
