import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/on_boarding.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/image.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  //functon skip on boarding
  Future<bool> _isFirstOpening() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isFirstOpening(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final isFirstTime = snapshot.data ?? true;
          return AnimatedSplashScreen(
            splash: MyImages.splashScreen,
            nextScreen: isLoggedIn
                ? const LoginScreen()
                : isFirstTime
                    ? const OnBordingScreen()
                    : const LoginScreen(),
            splashIconSize: HelperFuctions.screenWidth(),
            centered: true,
            backgroundColor: MyColors.white,
            duration: 2500,
          );
        }
      },
    );
  }
}
