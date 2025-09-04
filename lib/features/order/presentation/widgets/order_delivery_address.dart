import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

class OrderDeliveryAddress extends StatefulWidget {
  final String name;
  final String phone;
  final String address;

  const OrderDeliveryAddress({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
  });

  @override
  State<OrderDeliveryAddress> createState() => _OrderDeliveryAddressState();
}

class _OrderDeliveryAddressState extends State<OrderDeliveryAddress> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: ExpansionTile(
        // Remove default dividers
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
          side: BorderSide.none,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
          side: BorderSide.none,
        ),
        tilePadding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.sm,
          vertical: AppSizes.padding.xs,
        ),

        title: Text(
          "Delivery Address",
          style: AppTextStyles.bodyMedium(context),
        ),
        trailing: Icon(
          _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        ),
        onExpansionChanged: (expanded) {
          setState(() => _expanded = expanded);
        },
        children: [
          Padding(
            padding: EdgeInsets.all(AppSizes.padding.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.name}  ${widget.phone}",
                  style: AppTextStyles.bodySmall(context),
                ),
                SizedBox(height: AppSizes.spacing.xs),
                Text(widget.address, style: AppTextStyles.bodySmall(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
