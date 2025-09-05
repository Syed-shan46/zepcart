import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/order/presentation/widgets/order_item_card.dart';

class OrderProductItems extends StatelessWidget {
  const OrderProductItems({
    super.key,
    required this.widget,
    required this.context,
  });

  final OrderItemCard widget;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
            child: Image.network(
              widget.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: AppSizes.spacing.sm),

          // Textual info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Color Varient
                Text(
                  widget.color,
                  style: context.text.bodySmall?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSizes.spacing.xs),

                // Item Name
                Text(
                  widget.itemName,
                  style: context.text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppSizes.spacing.xs),

                // Price & Quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Item Price
                    Text(
                      '\$${widget.price.toString()}',
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary,
                      ),
                    ),

                    // Quantity
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: AppSizes.padding.sm,
                          top: AppSizes.padding.xs,
                        ),
                        child: Text(
                          '${AppStringsOrder.qty}: 1',
                          style: context.text.bodySmall?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
