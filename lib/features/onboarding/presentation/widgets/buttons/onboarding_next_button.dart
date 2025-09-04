import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/features/onboarding/controllers/on_boarding_image_controller.dart';
import 'package:zepcart/shared/widgets/containers/app_circular_container.dart';

// A Flutter widget displaying a stylized next button for onboarding screens with layered circular effects.
// Triggers the next onboarding page action when tapped.
class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 10.h,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: () => OnBoardingController.instance.nextPage(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer soft circle using alpha
              AppCircularContainer(
                height: AppSizes.height.xxl,
                width: 75,
                color: context.colors.primary.withAlpha(
                  AppOpacities.veryLowOpaque,
                ), // Soft outer circle
              ),

              // Inner solid circle button
              AppCircularContainer(
                height: 55,
                width: 55,
                child: Icon(Icons.arrow_forward, color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
