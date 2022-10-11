import 'package:flutter/material.dart';

import '../../presentation/add_edit_device/add_edit_device_page.dart';
import '../../presentation/add_edit_device/add_edit_page_params.dart';
import '../../presentation/app_navigation.dart';
import '../../presentation/not_found/not_found_page.dart';

abstract class AppRoute {
  static const String appNavigationRoute = '/';
  static const String addEditRoute = '/add_edit_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case AppRoute.appNavigationRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AppNavigation(),
        );
      case AppRoute.addEditRoute:
        final addEditParams = arguments as AddEditPageParams;
        return MaterialPageRoute<dynamic>(
          builder: (_) => AddEditDevicePage(params: addEditParams),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
