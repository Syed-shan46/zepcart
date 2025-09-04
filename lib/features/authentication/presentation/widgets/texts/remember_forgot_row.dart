import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A reusable widget displaying a "Remember Me" checkbox alongside a "Forgot Password?" button.
// Supports state management for the checkbox and navigation to the forgot password screen.
class RememberForgotRow extends StatelessWidget {
  final bool rememberMe; // Current state of the checkbox
  final ValueChanged<bool?>
  onRememberChanged; // Callback when checkbox value changes

  const RememberForgotRow({
    super.key,
    required this.rememberMe,
    required this.onRememberChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // Spread the checkbox and button to opposite ends
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // "Remember Me" Checkbox and Label
        Row(
          children: [
            Checkbox(
              value: rememberMe, // Binds current checkbox value
              onChanged: onRememberChanged, // Callback to update checkbox state
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius.xs),
              ),
              side: BorderSide(color: context.colors.outline),
              materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap, // Reduce padding size
              visualDensity:
                  VisualDensity.compact, // Reduce space around checkbox
            ),
            Text(
              AppStringsAuth.rememberMe,
              style: AppTextStyles.bodySmall(context),
            ),
          ],
        ),

        // "Forgot Password?" Text Button
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
          child: Text(
            AppStringsAuth.forgotPassword,
            style: context.text.bodySmall?.copyWith(
              color: context.colors.primary, // Highlight link color
            ),
          ),
        ),
      ],
    );
  }
}
