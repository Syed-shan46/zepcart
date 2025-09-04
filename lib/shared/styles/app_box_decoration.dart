import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';

// A utility class providing adaptive BoxDecoration that switches styles based on light or dark theme.
// Includes background color and optional shadow for consistent app appearance.
class AppBoxDecoration {
  // Returns a BoxDecoration based on current theme (dark/light).
  static BoxDecoration dynamic(BuildContext context) {
    return BoxDecoration(
      // Background color changes based on theme
      color: context.isDarkMode
          ? AppColors.grey.withAlpha(
              AppOpacities.almostTransparent,
            ) // Slight grey in dark mode
          : AppColors.white, // White in light mode
      // Apply a subtle shadow only in light mode
      boxShadow: context.isDarkMode
          ? [] // No shadow in dark mode for flatter appearance
          : [
              BoxShadow(
                color: AppColors.black.withAlpha(13), // Very soft shadow
                blurRadius: 5,
                offset: const Offset(0, 2), // Slight downward offset
              ),
            ],

      // Rounded corners (configurable via AppSizes)
      borderRadius: BorderRadius.circular(AppSizes.borderRadius.lg),
    );
  }
}
