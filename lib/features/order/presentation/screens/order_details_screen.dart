import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/order/presentation/providers/order_provider.dart';
import 'package:zepcart/features/order/presentation/widgets/order_chat_cancel_btn.dart';
import 'package:zepcart/features/order/presentation/widgets/order_info_card.dart';
import 'package:zepcart/features/order/presentation/widgets/order_item_card.dart';
import 'package:zepcart/features/order/presentation/widgets/order_status_header.dart';
import 'package:zepcart/features/order/presentation/widgets/orders_stepper.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class OrderDetailsScreen extends ConsumerWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);

    return Scaffold(
      // AppBar with Title
      appBar: PrimaryAppbar(
        title: AppStringsOrder.orderDetailsTitle,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.cart),
            icon: Icon(Iconsax.shopping_bag, size: AppSizes.icon.md),
          ),
          SizedBox(width: AppSizes.spacing.md),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status Header No padding for this
            OrderStatusHeader(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
              child: Column(
                children: [
                  // Orders Stepper
                  OrdersStepper(),
                  SizedBox(height: AppSizes.spacing.betweenSections),

                  // Order Info , Address,Phone
                  OrderInfoCard(),
                  SizedBox(height: AppSizes.spacing.betweenItems),

                  // Ordered Item  Card
                  OrderItemCard(
                    color: orders.first.color,
                    context: context,
                    price: orders.first.price.toDouble(),
                    orderId: orders.first.id,
                    image: orders.first.image,
                    itemName: orders.first.name,
                  ),
                  SizedBox(
                    height:
                        AppSizes.spacing.betweenSections + AppSizes.spacing.sm,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Chat and Cancel Button
      bottomNavigationBar: OrderChatCancelBtn(),
    );
  }
}
