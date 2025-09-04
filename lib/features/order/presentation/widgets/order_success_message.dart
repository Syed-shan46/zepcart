import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';

// A Flutter widget displaying a success message with an order ID after order placement.
// Includes a check icon and styled thank-you text for user confirmation.
class OrderSuccessMessage extends StatelessWidget {
  final String orderId;
  const OrderSuccessMessage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding.sm),
      child: Row(
        children: [
          // Success check icon
          Icon(Icons.check_circle, color: AppColors.success),
          SizedBox(width: AppSizes.spacing.sm),

          // Message with order ID
          Expanded(
            child: Text.rich(
              TextSpan(
                text: AppStringsOrder.thankYouMessage,
                children: [
                  TextSpan(
                    text: "ID: #$orderId",
                    style: context.text.bodySmall?.copyWith(color: AppColors.grey),
                  ),
                ],
                style: TextStyle(fontSize: AppSizes.font.md),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
