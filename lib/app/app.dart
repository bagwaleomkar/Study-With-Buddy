import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import 'theme.dart';
import 'routes.dart';

/// Root application widget configuring themes and routing.
class StudyWithBuddyApp extends StatelessWidget {
  final String initialRoute;

  const StudyWithBuddyApp({
    super.key,
    this.initialRoute = AppRoutes.splash,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
