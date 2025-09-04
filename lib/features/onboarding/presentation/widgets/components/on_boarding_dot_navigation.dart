import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/features/onboarding/controllers/on_boarding_image_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// A Flutter widget displaying a smooth, interactive page indicator for onboarding screens.
// Positioned below the app bar and allows navigation by tapping the dots.
class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key, this.dHeight = 5, this.dWidth = 8});

  final double dHeight;
  final double dWidth;

  @override
  Widget build(BuildContext context) {
    // Access the onboarding controller instance
    final controller = OnBoardingController.instance;
    return Positioned(
      // Position the indicator below the app bar
      top: AppDeviceUtils.getAppBarHeight() + 22,
      left: AppSizes.padding.lg,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.pageController,
          // Navigate to the page when a dot is clicked
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: context.colors.primary, // Color of the active dot
            dotHeight: dHeight, // Height of the dot
            dotWidth: dWidth, // Width of the dot
          ),
        ),
      ),
    );
  }
}
