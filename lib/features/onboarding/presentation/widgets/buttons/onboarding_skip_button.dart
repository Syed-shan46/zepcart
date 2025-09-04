import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings.dart';
import 'package:zepcart/features/onboarding/controllers/on_boarding_image_controller.dart';

// A Flutter widget displaying a "Skip" text button positioned at the top-right of the onboarding screen.
// Calls the skipPage method to jump past the onboarding sequence when tapped.
class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      right: 16,
      child: TextButton(
        onPressed: () {
          try {
            OnBoardingController.instance.skipPage();
          } catch (e, st) {
            debugPrint('Error in skipPage: $e\n$st');
          }
        },
        style: TextButton.styleFrom(foregroundColor: context.colors.primary),
        child: const Text(AppStrings.skip),
      ),
    );
  }
}
