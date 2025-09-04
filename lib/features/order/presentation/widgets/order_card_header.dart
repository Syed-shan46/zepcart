import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/order/presentation/widgets/order_item_card.dart';

// A reusable widget that displays the header section for

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({
    super.key,
    required this.widget,
    required this.context,
  });

  final OrderItemCard widget;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Order ID text
        Text(
          '${AppStringsOrder.order}: ${widget.orderId}',
          style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),

        Row(
          children: [
            // Displays total items count in the order
            Text(
              '(1 ${AppStringsOrder.items})',
              style: context.text.labelMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(width: AppSizes.spacing.sm),

            // Displays total order price
            Text(
              '\$${widget.price}',
              style: context.text.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
