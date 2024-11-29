import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static StorageService? _instance;
  static SharedPreferences? _preferences;

  StorageService._();

  static Future<StorageService> getInstance() async {
    _instance ??= StorageService._();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // App State
  Future<void> setFirstTime(bool isFirstTime) async {
    await _preferences?.setBool('isFirstTime', isFirstTime);
  }

  bool isFirstTime() {
    return _preferences?.getBool('isFirstTime') ?? true;
  }

  // Auth State
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _preferences?.setBool('isLoggedIn', isLoggedIn);
  }

  bool isLoggedIn() {
    return _preferences?.getBool('isLoggedIn') ?? false;
  }
}