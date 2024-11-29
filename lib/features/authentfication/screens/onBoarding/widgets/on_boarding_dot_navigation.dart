import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingControllers.instance;

    return Positioned(
      bottom: FSizes.defaultSpace * 2,
      left: FSizes.defaultSpace,
      right: FSizes.defaultSpace,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          onDotClicked: controller.dotNavigationClick,
          effect: const ExpandingDotsEffect(
            activeDotColor: MyColors.primary,
            dotHeight: 6,
          ),
        ),
      ),
    );
  }
}