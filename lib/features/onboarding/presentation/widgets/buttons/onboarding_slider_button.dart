import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/routes/app_routes.dart';

// A Flutter widget displaying a slide-to-act button positioned above the bottom navigation bar on onboarding screens.
// On successful slide, navigates the user to the login screen using GetX routing.
class OnboardingSliderButton extends StatelessWidget {
  const OnboardingSliderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //  Position the slider button at the bottom of the screen, above the bottom navigation bar
      bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 10,
      left: AppSizes.spacing.md,
      right: AppSizes.spacing.md,

      child: SlideAction(
        key: GlobalKey(),
        text: AppStrings.getStarted,

        textStyle: context.text.titleSmall?.copyWith(color: AppColors.white),
        submittedIcon: Icon(Icons.check, color: AppColors.white),
        outerColor: context.colors.primary,
        innerColor: AppColors.white.withAlpha(AppOpacities.veryLowOpaque),
        elevation: 4,
        height: AppSizes.height.lg,
        borderRadius: AppSizes.borderRadius.xl * 2,
        sliderButtonIcon: const Icon(
          Icons.arrow_forward,
          color: AppColors.white,
        ),
        onSubmit: () {
          Get.toNamed(AppRoutes.login);
          return null;
        },
      ),
    );
  }
}
