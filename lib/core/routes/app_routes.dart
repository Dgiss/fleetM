import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/on_boarding.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const OnBoardingScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
  };
}