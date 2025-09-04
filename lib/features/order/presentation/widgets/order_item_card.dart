import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/order/presentation/widgets/order_card_header.dart';
import 'package:zepcart/features/order/presentation/widgets/order_product_items.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';
import 'package:zepcart/shared/widgets/overlays/app_divider.dart';

// A Flutter widget displaying order summary cards with expandable product item details.
// Tapping navigates to detailed order information; supports view more/less toggle.
class OrderItemCard extends StatefulWidget {
  final String orderId;
  final double price;
  final String image;
  final String itemName;
  final String color;
  const OrderItemCard({
    super.key,
    required this.context,
    required this.orderId,
    required this.price,
    required this.image,
    required this.itemName,
    required this.color,
  });

  final BuildContext context;

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.orderDetails),
      child: Container(
        decoration: AppBoxDecoration.dynamic(context),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Header
              OrderCardHeader(widget: widget, context: context),
              SizedBox(height: AppSizes.spacing.xs),
              AppDivider(),

              // Order Product Items
              OrderProductItems(widget: widget, context: context),

              // View All toggle
              _buildViewAllToggle(context.text),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildViewAllToggle(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.orderDetails),
          child: Row(
            children: [
              // View All Text
              Text(
                AppStringsOrder.viewAll,
                style: textTheme.bodyMedium?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Right Side Expand Icon
              Icon(
                Icons.chevron_right,
                color: context.colors.primary,
                size: AppSizes.font.xl,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
