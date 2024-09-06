import 'package:arena_management/features/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/presentation/pages/home_screen.dart';
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: routeSettings,
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Container(),
          settings: routeSettings,
        );
    }
  }
}
