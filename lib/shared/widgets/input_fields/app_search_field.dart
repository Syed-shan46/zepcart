import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/routes/app_routes.dart';

// A styled Cupertino search text field with adaptive theming for light and dark modes.
// Designed for consistent use across the app in places like product listings or home screens.
class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Adds horizontal padding to separate the field from screen edges
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),

      child: GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.search),
        child: AbsorbPointer(
          // Prevents the default text field behavior
          child: CupertinoSearchTextField(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
            // Custom padding inside the field (controls spacing between icon/text)
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.padding.sm,
              vertical: AppSizes.padding.smd - AppOffsets.nudgeXS,
            ),
            itemSize: 40,
            // Styling the placeholder text based on theme (light/dark)

            // Background adapts to light/dark mode from theme
            backgroundColor: context.colors.surfaceContainerHigh,
            // Leading icon (search)
            prefixIcon: Icon(
              Iconsax.search_favorite_1_copy,
              size: AppSizes.icon.md,
            ),
            // Trailing icon (clear)
            suffixIcon: Icon(Icons.close, size: AppSizes.icon.md),
          ),
        ),
      ),
    );
  }
}
