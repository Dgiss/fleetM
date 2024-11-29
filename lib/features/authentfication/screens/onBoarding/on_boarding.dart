import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_dot_navigation.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_page.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/onBoarding/widgets/on_boarding_skip.dart';
import 'package:fleet_watcher_mobile/utils/constants/image.dart';
import 'package:fleet_watcher_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingControllers());

    return Scaffold(
      body: Stack(
        children: [
          // Main Content - PageView
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: MyImages.onBoarding1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: MyImages.onBoarding2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: MyImages.onBoarding3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
                isFinalPage: true,
              ),
            ],
          ),

          // Skip/Start Button
          const OnBoardingSkip(),

          // Dot Navigation
          const OnBoardingDotNavigation(),
        ],
      ),
    );
  }
}