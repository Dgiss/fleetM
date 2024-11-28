import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/login/login.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingStartBtn extends StatelessWidget {
  const OnBoardingStartBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBoardingControllers controller = OnBoardingControllers.instance;
    return Positioned(
      bottom: 50,
      right: FSizes.defaultSpace,
      left: FSizes.defaultSpace,
      child: Obx(() {
        final bool isFinalPage = controller.isFinalPage();
        return GestureDetector(
          // Disable the button when it's not the final page
          onTap: isFinalPage
              ? () async {
                  await controller.completeOnBoarding();
                  HelperFuctions.navigateToScreenWithouReturn(
                      context, const LoginScreen());
                }
              : null,
          child: Container(
            height: 50,
            width: HelperFuctions.screenWidth() * .8,
            decoration: BoxDecoration(
              color: isFinalPage ? MyColors.primary : MyColors.grey,
              borderRadius: BorderRadius.circular(FSizes.borderRadiusMd),
            ),
            child: Center(
              child: Text(
                "btnCommencez".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: MyColors.white),
              ),
            ),
          ),
        );
      }),
    );
  }
}
