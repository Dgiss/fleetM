import 'package:fleet_watcher_mobile/features/authentfication/controllers/on_boarding_controllers.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final control = OnBoardingControllers.instance;
    return Obx(() => control.isFinalPage()
        ? const SizedBox.shrink()
        : Positioned(
            top: DeviceUtils.getAppBarHeight() - (FSizes.defaultSpace / 2),
            right: FSizes.defaultSpace / 2,
            child: TextButton(
              onPressed: control.skipPage,
              child: Text(
                'skip'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MyColors.primary),
              ),
            ),
          ));
  }
}
