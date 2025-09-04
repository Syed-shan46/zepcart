import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/core/common/localization/app_strings_onboarding.dart';
import 'package:zepcart/features/onboarding/controllers/on_boarding_image_controller.dart';
import 'package:zepcart/features/onboarding/presentation/widgets/components/on_boarding_dot_navigation.dart';
import 'package:zepcart/features/onboarding/presentation/widgets/buttons/onboarding_next_button.dart';
import 'package:zepcart/features/onboarding/presentation/widgets/buttons/onboarding_slider_button.dart';
import '../widgets/components/on_boarding_image.dart';
import '../widgets/buttons/onboarding_skip_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller to manage onboarding state
    final controller = Get.put(OnBoardingController(), permanent: false);

    return Scaffold(
      body: Stack(
        children: [
          // Onboarding Images
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              // Onboarding image
              OnBoardingImage(
                image: AppImages.onBoardingImage1,
                title: AppStringsOnboarding.title1,
                subtitle: AppStringsOnboarding.subtitle1,
              ),

              // Onboarding image
              OnBoardingImage(
                image: AppImages.onBoardingImage2,
                title: AppStringsOnboarding.title2,
                subtitle: AppStringsOnboarding.subtitle2,
              ),

              // Onboarding image
              OnBoardingImage(
                image: AppImages.onBoardingImage3,
                title: AppStringsOnboarding.title3,
                subtitle: AppStringsOnboarding.subtitle3,
              ),
            ],
          ),

          // Skip Button
          const OnboardingSkipButton(),

          // Dot Navigation
          const OnBoardingNavigation(),

          // Next Button or Slide-to-Start Button depending on the current page index
          Obx(() {
            if (controller.currentPageIndex.value < 2) {
              // Next Button
              return const OnBoardingNextButton();
            } else {
              // Slide-to-Start Button
              return OnboardingSliderButton();
            }
          }),
        ],
      ),
    );
  }
}
