import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_item_tile.dart';

class CheckoutItemsScreen extends ConsumerWidget {
  const CheckoutItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      //  AppBar with Title
      appBar: AppBar(title: Text(AppStringsCheckout.checkout)),

      // List of checkout items with padding
      body: ListView.separated(
        itemCount: cart.length, // Showing only 3 sample products
        separatorBuilder: (_, __) =>
            SizedBox(height: AppSizes.spacing.betweenItems),
        itemBuilder: (context, index) {
          final item = cart[index];

          // Each product represented by a CheckoutItemTile
          return CheckoutItemScreenTile(
            product: item.product,
            quantity: item.quantity,
          );
        },
      ),
    );
  }
}
