import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingControllers extends GetxController {
  static OnBoardingControllers get instance => Get.find();
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    Get.offAll(const LoginScreen());
  }

  bool isFinalPage() {
    return currentPageIndex.value == 2;
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  Future<void> completeOnBoarding() async {
    // Implement the logic for completing onboarding
    // e.g., saving isFirstTime = false
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }
}
