import 'package:flutter/material.dart';
import 'package:flutter_steps/flutter_steps.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';

// Utility function that returns a list of step widgets representing checkout progress.
// Each step updates icon and color based on the current checkout step index.
List<Steps> getSteps(int currentStep) {
  return [
    // Step 1: Checkout step
    Steps(
      title: AppStringsCheckout.checkout,
      isActive: currentStep >= 0, // Always active from step 0 onwards
      leading: Container(
        padding: EdgeInsets.all(AppSizes.padding.xs / 2),
        decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
        child: Icon(
          currentStep >= 0
              ? Icons
                  .check // Show check if step is reached
              : Icons.shopping_cart_checkout_outlined, // Default icon
          color: AppColors.white,
          size: AppSizes.font.md,
        ),
      ),
    ),

    // Step 2: Payment step
    Steps(
      title: AppStringsCheckout.payment,
      isActive: currentStep >= 1,
      leading: Container(
        padding: EdgeInsets.all(AppSizes.padding.xs / 2),
        decoration: BoxDecoration(
          color: currentStep >= 1 ? AppColors.primary : AppColors.grey, // Highlight if active
          shape: BoxShape.circle,
        ),
        child: Icon(
          currentStep > 1
              ? Icons
                  .check // Show check if step is complete
              : Icons.payment, // Payment icon
          color: AppColors.white,
          size: AppSizes.font.md,
        ),
      ),
    ),

    // Step 3: Success/Delivery step
    Steps(
      title: AppStringsCheckout.success,
      isActive: currentStep >= 2,
      leading: Container(
        padding: EdgeInsets.all(AppSizes.padding.xs / 2),
        decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
        child: Icon(
          Icons.local_shipping_outlined, // Delivery icon
          color: AppColors.white,
          size: AppSizes.font.md,
        ),
      ),
    ),
  ];
}
