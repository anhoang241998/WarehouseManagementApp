import 'package:flutter/material.dart';

import '../../presentation/home/home_page.dart';
import '../../presentation/not_found/not_found_page.dart';

abstract class AppRoute {
  static const String homeRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case AppRoute.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
