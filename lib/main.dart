import 'package:fleet_watcher_mobile/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;
    runApp(App(
      isLoggedIn: isLoggedIn,
      isFirstTime: isFirstTime,
    ));
  } catch (e) {
    runApp(const App(
      isLoggedIn: false,
      isFirstTime: true,
    ));
  }
}
