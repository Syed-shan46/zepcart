import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/checkout/data/address_data.dart';
import 'package:zepcart/features/checkout/presentation/providers/checkout_provider.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_item_card.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_items_header.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_order_summary.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_promo_code.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/cards/saved_address_card.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';
import 'package:zepcart/shared/widgets/overlays/app_divider.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  final VoidCallback onNext; // Callback when user proceeds to next step
  const CheckoutScreen({super.key, required this.onNext});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  int selectedIndex = 0; // Currently selected address index
  String currentCity = 'Dubai'; // Placeholder for current city

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final checkoutState = ref.watch(checkoutProvider);

    // Update checkout total whenever subtotal changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(checkoutProvider.notifier).updateTotal(cartNotifier.subTotal);
    });

    final cart = ref.watch(cartProvider);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.smd,
          vertical: AppSizes.padding.md + AppOffsets.nudgeSM,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pay Button to proceed to payment screen
            AppPrimaryButton(
              text: "Pay \$${checkoutState.total.toStringAsFixed(2)}",
              onPressed: widget.onNext,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Address Section Header
            CheckoutItemsHeader(
              title: AppStringsCheckout.selectAddress,
              onTap: () => Get.toNamed(AppRoutes.savedAddress),
            ),

            // Displaying a selected saved address card
            SavedAddressCard(address: addressList.first, isSelected: true),
            SizedBox(height: AppSizes.spacing.betweenItemsSmall),

            // Items Section Header
            CheckoutItemsHeader(
              title: AppStringsCheckout.items,
              onTap: () => Get.toNamed(AppRoutes.checkoutItems),
            ),
            SizedBox(height: AppSizes.spacing.betweenItemsSmall),

            //Horizontal list of checkout item thumbnails
            Row(
              children: [
                // First 3 images
                for (int i = 0; i < cart.length && i < 3; i++)
                  CheckoutItemCard(imagePath: cart[i].product.images.first),

                // Show +extra overlay if more than 3 items
                if (cart.length > 3)
                  CheckoutItemCard(
                    imagePath: cart[3].product.images.first, // 4th image
                    extraCount: cart.length - 3, // remaining count
                  ),
              ],
            ),
            SizedBox(height: AppSizes.spacing.betweenItems),

            // Promo Code Input Section
            CheckoutPromoCode(),
            SizedBox(height: AppSizes.spacing.betweenItems),

            // Order Summary Details
            CheckoutOrderSummary(
              label: AppStringsCheckout.subTotal,
              amount: '\$${cartNotifier.subTotal.toStringAsFixed(2)}',
            ),
            CheckoutOrderSummary(
              label: AppStringsCheckout.shippingFee,
              amount: "\$${checkoutState.shippingFee.toStringAsFixed(2)}",
            ),
            CheckoutOrderSummary(
              label: AppStringsCheckout.discount,
              amount: "-\$${checkoutState.discount.toStringAsFixed(2)}",
            ),

            // Divider between totals
            AppDivider(),

            // Final Total
            CheckoutOrderSummary(
              label: AppStringsCheckout.total,
              amount: "\$${checkoutState.total.toStringAsFixed(2)}",
              isBold: true,
            ),
            SizedBox(height: AppSizes.spacing.xl),
          ],
        ),
      ),

      // Bottom Button Section
    );
  }
}
