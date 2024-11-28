import 'package:fleet_watcher_mobile/features/authentfication/screens/home/home_screen.dart';
import 'package:fleet_watcher_mobile/utils/constants/strings.dart';
import 'package:fleet_watcher_mobile/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  final bool isLoggedIn;
  final bool isFirstTime;

  const App({super.key, required this.isLoggedIn, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LanguageTranslate(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("fr", "FR"),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // home: isFirstTime
      //     ? const OnBordingScreen()
      //     : isLoggedIn
      //         ? const HomeScreen()
      //         : const LoginScreen(),
      home: const HomeScreen(),
    );
  }
}
