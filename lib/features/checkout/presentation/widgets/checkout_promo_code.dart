import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';

// A Flutter widget providing a styled text field for entering promo codes during checkout.
// Includes an "Apply" button as a suffix to submit the promo code.
class CheckoutPromoCode extends StatelessWidget {
  const CheckoutPromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // Background fill color
        filled: true,
        fillColor: context.isDarkMode
            ? AppColors.grey.withAlpha(15)
            : AppColors.primary.withAlpha(AppOpacities.almostTransparent),

        // Inner padding
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.md,
          vertical: AppSizes.padding.smd,
        ),

        // Placeholder text
        hintText: AppStringsCheckout.promocodeHint,

        // Suffix button ("Apply")
        suffixIcon: TextButton(
          onPressed: () {}, // Action when apply is pressed
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.sm),
          ),
          child: Text(
            AppStringsCheckout.apply,
            style: context.text.labelMedium?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Border when enabled
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: BorderSide.none, // No visible border
        ),

        // Default border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
