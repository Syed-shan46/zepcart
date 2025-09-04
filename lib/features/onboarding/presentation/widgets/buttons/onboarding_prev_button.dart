import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/features/onboarding/controllers/on_boarding_image_controller.dart';

// A Flutter widget providing a circular outlined button to navigate to the previous onboarding page.
// Positioned above the bottom navigation bar on the left side for easy access.
class OnBoardingPrevButton extends StatelessWidget {
  const OnBoardingPrevButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Position the button just above the bottom navigation bar on the left
      bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 10,
      left: AppSizes.padding.lg,
      child: SizedBox(
        height: 50.h,
        child: OutlinedButton(
          onPressed: () => OnBoardingController.instance.prevPage(),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.teal),
            shape: const CircleBorder(),
          ),

          // Back arrow
          child: Icon(Icons.arrow_back_ios, size: 19),
        ),
      ),
    );
  }
}
