import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final control = OnBoardingControllers.instance;
    final screenWidth = DeviceUtils.getScreenWidth(context);

    return Positioned(
      left: (screenWidth - FSizes.defaultSpace) / 2.5,
      bottom: DeviceUtils.getBottomNavigationBarHeight() + 250,
      child: Column(
        children: [
          SmoothPageIndicator(
            controller: control.pageController,
            count: 3,
            onDotClicked: control.dotNavigationClick,
            effect: const ExpandingDotsEffect(
              activeDotColor: MyColors.primary,
              dotHeight: 6,
            ),
          ),
          const Gap(FSizes.spaceBtwSection),
        ],
      ),
    );
  }
}
