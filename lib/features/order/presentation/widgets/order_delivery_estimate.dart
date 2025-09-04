import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying an estimated delivery date with a shipping icon.
// Formats and presents the provided estimated date in a user-friendly format.
class OrderDeliveryEstimate extends StatelessWidget {
  final DateTime estimatedDate;

  const OrderDeliveryEstimate({super.key, required this.estimatedDate});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy').format(estimatedDate);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding.sm),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.sm,
          vertical: AppSizes.padding.xs,
        ),

        child: Row(
          children: [
            const Icon(Icons.local_shipping_outlined, color: AppColors.grey),
            SizedBox(width: AppSizes.spacing.betweenItems),
            Text("Estimated delivery by $formattedDate", style: context.text.bodyMedium),
          ],
        ),
      ),
    );
  }
}
