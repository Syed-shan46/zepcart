import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';

class OrderPaymentMethodRow extends StatelessWidget {
  const OrderPaymentMethodRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.credit_card, size: AppSizes.font.lg),
        SizedBox(width: AppSizes.spacing.sm),

        Text(
          AppStringsOrder.online,
          style: context.text.bodyMedium?.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
