import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.isFinalPage = false,
      this.onComplete});
  final String image, title, subtitle;
  final bool isFinalPage;
  final Function? onComplete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(FSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: HelperFuctions.screenWidth() * .8,
            height: HelperFuctions.screenHeight() * .6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .apply(color: MyColors.primary),
            textAlign: TextAlign.center,
          ),
          const Gap(FSizes.spaceBtwSection),
          SizedBox(
            width: HelperFuctions.screenWidth() * .7,
            child: Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(fontSizeFactor: 1.2),
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(FSizes.spaceBtwSection),
        ],
      ),
    );
  }
}
