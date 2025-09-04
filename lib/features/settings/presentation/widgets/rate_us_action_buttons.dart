import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';

// A Flutter widget displaying a row of two equally expanded buttons: "Cancel" and "Submit".
// Uses elevated and outlined button styles with dynamic theming and square edges.
class RateUsActionButtons extends StatelessWidget {
  const RateUsActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cancel Button (Elevated)
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // No rounded corners
              ),
            ),
            child: Text(AppStringsSettings.cancel),
          ),
        ),

        // Submit Button (Outlined)
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: AppColors.transparent,
              ), // No visible border
              backgroundColor: context.colors.surface, // Dynamic background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Consistent square shape
              ),
            ),
            child: Text(
              AppStringsSettings.submit,
              style: TextStyle(
                color: AppColors.sameBrightness(context), // Dynamic text color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
