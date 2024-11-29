import 'package:fleet_watcher_mobile/core/routes/app_routes.dart';
import 'package:fleet_watcher_mobile/core/services/storage_service.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/home/home_screen.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/on_boarding.dart';
import 'package:fleet_watcher_mobile/utils/constants/strings.dart';
import 'package:fleet_watcher_mobile/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fleet Watcher',
      translations: LanguageTranslate(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("fr", "FR"),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      home: FutureBuilder(
        future: StorageService.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('Error initializing storage: ${snapshot.error}');
            return const Center(
              child: Text('Error initializing app. Please try again.'),
            );
          }
          
          if (snapshot.connectionState == ConnectionState.done) {
            try {
              final storageService = snapshot.data as StorageService;
              if (storageService.isFirstTime()) {
                return const OnBoardingScreen();
              } else if (!storageService.isLoggedIn()) {
                return const LoginScreen();
              }
              return const HomeScreen();
            } catch (e, stack) {
              debugPrint('Error in routing logic: $e');
              debugPrint('Stack trace: $stack');
              return const Center(
                child: Text('Something went wrong. Please restart the app.'),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}