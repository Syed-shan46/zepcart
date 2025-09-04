import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/checkout/data/address_data.dart';
import 'package:zepcart/features/checkout/presentation/providers/checkout_provider.dart';
import 'package:zepcart/features/order/presentation/widgets/order_payment_method_row.dart';
import 'package:zepcart/features/order/presentation/widgets/order_price_row.dart';
import 'package:zepcart/features/order/presentation/widgets/order_summary_tile.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/headers/app_section_title.dart';
import 'package:zepcart/features/order/presentation/widgets/order_delivery_address.dart';
import 'package:zepcart/features/order/presentation/widgets/order_delivery_estimate.dart';
import 'package:zepcart/features/order/presentation/widgets/order_success_message.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';
import 'package:zepcart/shared/widgets/overlays/app_divider.dart';

class OrderConfirmationScreen extends ConsumerWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutState = ref.watch(checkoutProvider);
    final cart = ref.watch(cartProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Green Tick and Message
                    OrderSuccessMessage(orderId: "#93225058"),
                    AppDivider(thickness: AppSizes.divider.thick),

                    // Delivery Estimate Box
                    OrderDeliveryEstimate(estimatedDate: DateTime(2025, 8, 25)),
                    AppDivider(thickness: AppSizes.divider.thick),

                    // Product Card (Order summary with expand)
                    if (cart.isNotEmpty)
                      OrderSummaryTile(title: 'Items in this order')
                    else
                      const Text("No items found"),

                    AppDivider(thickness: AppSizes.divider.thick),

                    // Delivery Address
                    OrderDeliveryAddress(
                      name: addressList.first.name,
                      phone: addressList.first.phone,
                      address: addressList.first.address,
                    ),

                    AppDivider(thickness: AppSizes.divider.thick),

                    // Payment Method
                    AppSectionTitle(title: AppStringsOrder.paymentMethod),
                    SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                    OrderPaymentMethodRow(),
                    AppDivider(thickness: AppSizes.divider.thick),

                    // Price Details
                    AppSectionTitle(title: AppStringsOrder.priceDetails),
                    SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                    // Shipping Fee
                    PriceRow(
                      label: AppStringsOrder.shipping,
                      amount: checkoutState.shippingFee.toStringAsFixed(2),
                    ),
                    SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                    // Total
                    PriceRow(
                      label: AppStringsOrder.total,
                      amount: checkoutState.total.toStringAsFixed(2),
                    ),
                  ],
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: EdgeInsets.all(AppSizes.padding.md),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: AppPrimaryButton(
                  text: AppStringsOrder.continueShopping,
                  onPressed: () {
                    Get.toNamed(AppRoutes.cupertinoBottomNav);
                    ref.read(cartProvider.notifier).clearCart();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
