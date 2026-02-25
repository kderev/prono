import 'package:flutter/material.dart';

import '../../features/details/presentation/details_screen.dart';
import '../../features/home/presentation/home_screen.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';
  static const String details = '/details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case details:
        final String title = settings.arguments as String? ?? 'Award Detail';
        return MaterialPageRoute<void>(
          builder: (_) => DetailsScreen(title: title),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
