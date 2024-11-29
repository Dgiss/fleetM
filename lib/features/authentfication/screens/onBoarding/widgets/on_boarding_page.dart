import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isFinalPage = false,
  });

  final String image, title, subtitle;
  final bool isFinalPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(FSizes.defaultSpace),
      child: Column(
        children: [
          const Spacer(),
          // Image
          Container(
            width: HelperFuctions.screenWidth() * 0.8,
            height: HelperFuctions.screenHeight() * 0.4,
            padding: const EdgeInsets.all(FSizes.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(FSizes.borderRadiusLg),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 40,
                      ),
                      const SizedBox(height: FSizes.sm),
                      Text(
                        'Image non trouvée',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: FSizes.spaceBtwItems),
          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: FSizes.defaultSpace),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: MyColors.darkGrey,
                    height: 1.5,
                    fontSize: 16,
                ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}