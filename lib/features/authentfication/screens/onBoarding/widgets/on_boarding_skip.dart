import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingControllers.instance;

    return Obx(() => Positioned(
          top: FSizes.defaultSpace * 2,
          right: FSizes.defaultSpace,
          child: TextButton(
            onPressed: () => controller.skipToLogin(context),
            child: Text(
              controller.currentPageIndex.value == 2 
                ? TTexts.start 
                : TTexts.skip,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: MyColors.primary),
            ),
          ),
        ));
  }
}