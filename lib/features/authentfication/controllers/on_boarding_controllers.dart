import 'package:fleet_watcher_mobile/core/services/storage_service.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingControllers extends GetxController {
  static OnBoardingControllers get instance => Get.find();

  final pageController = PageController();
  final currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> skipToLogin(BuildContext context) async {
    await completeOnboarding();
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void skipPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> completeOnboarding() async {
    final storage = await StorageService.getInstance();
    await storage.setFirstTime(false);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}