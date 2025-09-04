import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/checkout/data/address_data.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/overlays/app_divider.dart';

// A Flutter widget presenting detailed order information including delivery estimate, address, phone, and payment method.
// Uses styled layout with icons and dividers for clear and organized display.
class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.text;

    return Container(
      margin: EdgeInsets.zero,
      decoration: AppBoxDecoration.dynamic(context),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Delivery Estimate
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStringsOrder.deliveryEstimate,
                  style: textTheme.bodySmall,
                ),
                Text('July 3, 2025', style: textTheme.bodyMedium),
              ],
            ),
            AppDivider(),

            
            // Address block
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined, size: AppSizes.font.xl),
                SizedBox(width: AppSizes.spacing.xs),
                Expanded(
                  child: Text(
                    '${addressList.first.name} \n${addressList.first.address},',
                    style: textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacing.xs),

            
            // Phone Number
            
            Row(
              children: [
                Icon(Icons.phone_outlined, size: AppSizes.font.md),
                SizedBox(width: AppSizes.spacing.sm),
                Text(
                  addressList.first.phone,
                  style: AppTextStyles.bodySmall(context),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacing.sm),
            AppDivider(),

            
            // Payment method
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStringsOrder.paymentMethod, style: textTheme.bodySmall),
                Text('Credit Card *1234', style: textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
