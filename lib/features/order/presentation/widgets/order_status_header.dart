import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';

// A Flutter widget displaying the current order status with a title, subtitle, and shipping icon.
// Uses a gradient background for a visually distinct header section.
class OrderStatusHeader extends StatelessWidget {
  const OrderStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Outer container with padding and background gradient
    return Container(
      padding: EdgeInsets.all(AppSizes.padding.sm),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
      ),
      child: Row(
        children: [
          SizedBox(width: AppSizes.spacing.sm),

          // Main section: title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStringsOrder.shippedTitle,
                  style: context.text.titleMedium?.copyWith(color: AppColors.textWhite),
                ),
                Text(
                  AppStringsOrder.shippedSubtitle,
                  style: context.text.bodySmall?.copyWith(color: AppColors.textWhite),
                ),
              ],
            ),
          ),

          // Right icon section
          Padding(
            padding: EdgeInsets.only(right: AppSizes.padding.md),
            child: Icon(Icons.local_shipping_outlined, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
