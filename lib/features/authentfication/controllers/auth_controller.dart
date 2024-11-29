import 'package:fleet_watcher_mobile/core/services/storage_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<bool> login(String email, String password) async {
    _isLoading.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      if (email == "test@test.com" && password == "password") {
        final storage = await StorageService.getInstance();
        await storage.setLoggedIn(true);
        return true;
      }
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final storage = await StorageService.getInstance();
    await storage.setLoggedIn(false);
  }
}