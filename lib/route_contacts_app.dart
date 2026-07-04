import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

class RouteContactsApp extends StatelessWidget {
  const RouteContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route Contacts',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
