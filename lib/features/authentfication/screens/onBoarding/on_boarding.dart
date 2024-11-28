import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_dot_navigation.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_page.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_skip.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_start_btn.dart';
import 'package:fleet_watcher_mobile/utils/constants/image.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  Future<void> _completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    final control = Get.put(OnBoardingControllers());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: HelperFuctions.screenHeight(),
              child: PageView(
                controller: control.pageController,
                onPageChanged: control.updatePageIndicator,
                children: [
                  OnBoardingPage(
                    image: MyImages.onBoarding1,
                    title: "titleOnBoarding1".tr,
                    subtitle: "subTitleOnBoarding1".tr,
                  ),
                  OnBoardingPage(
                    image: MyImages.onBoarding2,
                    title: "titleOnBoarding2".tr,
                    subtitle: "subTitleOnBoarding2".tr,
                  ),
                  OnBoardingPage(
                      image: MyImages.onBoarding3,
                      title: "titleOnBoarding3".tr,
                      subtitle: "subTitleOnBoarding3".tr,
                      isFinalPage: true,
                      onComplete: () async {
                        //navigate & iterdit le revenue
                        await _completeOnBoarding();
                        HelperFuctions.navigateToScreenWithouReturn(
                            context, const LoginScreen());
                      }),
                ],
              ),
            ),
            const OnBoardingDotNavigation(),
            const OnBoardingStartBtn(),
            const OnBoardSkip(),
          ],
        ),
      ),
    );
  }
}
