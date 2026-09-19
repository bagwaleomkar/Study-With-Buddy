import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/main_navigation_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/buddy/buddy_screen.dart';
import '../screens/tasks/tasks_screen.dart';
import '../screens/study/study_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../widgets/error_view.dart';

/// Centralized route definitions and generator.
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String main = '/main';
  static const String home = '/home';
  static const String buddy = '/buddy';
  static const String tasks = '/tasks';
  static const String study = '/study';
  static const String profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case main:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
          settings: settings,
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case buddy:
        return MaterialPageRoute(
          builder: (_) => const BuddyScreen(),
          settings: settings,
        );

      case tasks:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
          settings: settings,
        );

      case study:
        return MaterialPageRoute(
          builder: (_) => const StudyScreen(),
          settings: settings,
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Not Found')),
            body: AppErrorView(
              title: 'Page Not Found',
              message: 'Route "${settings.name}" does not exist.',
            ),
          ),
          settings: settings,
        );
    }
  }
}
