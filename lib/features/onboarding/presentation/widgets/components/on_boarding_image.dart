import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget that displays a Lottie animation with a title and subtitle for onboarding screens.
// The widget uses responsive sizing based on the device screen dimensions.
class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final String image;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding.page),
      child: Column(
        children: [
          // Lottie animation
          Lottie.asset(
            image,
            width: AppDeviceUtils.getScreenWidth(context) * 0.8,
            height: AppDeviceUtils.getScreenHeight(context) * 0.6,
          ),

          // Onboarding title
          Text(title, style: AppTextStyles.heading2(context)),
          SizedBox(height: AppSizes.spacing.betweenItems),

          // Onboarding subtitle
          Text(subtitle, style: context.text.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
