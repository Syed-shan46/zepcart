import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/order/presentation/providers/order_provider.dart';
import 'package:zepcart/features/order/presentation/widgets/order_item_card.dart';
import 'package:zepcart/features/order/presentation/widgets/order_status_tab.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class MyOrdersScreen extends ConsumerWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersProvider);
    return Scaffold(
      // AppBar with TItle
      appBar: PrimaryAppbar(title: AppStringsOrder.yourOrderTitle),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
        child: Column(
          children: [
            // Order Status Tab
            const OrderStatusTab(),
            SizedBox(height: AppSizes.spacing.betweenItems),

            // Orders List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: AppSizes.padding.md),
                itemCount: orders.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: AppSizes.spacing.betweenItems),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  // Order Item Card
                  return OrderItemCard(
                    color: order.color,
                    context: context,
                    price: order.price.toDouble(),
                    orderId: order.id,
                    image: order.image,
                    itemName: order.name,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
