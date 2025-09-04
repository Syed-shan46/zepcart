// cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_cart.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:zepcart/features/cart/presentation/widgets/cart_total_bar.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsCart.cartTitle),

      // Bottom bar showing total price
      bottomNavigationBar:
          cart.isEmpty
              ? SizedBox.shrink()
              : CartTotalBar(total: cartNotifier.totalPrice),

      // Main body
      body:
          cart.isEmpty
              ? Center(
                // Empty Cart Message
                child: Lottie.asset(AppImages.notFound, fit: BoxFit.cover),
              )
              : ListView.separated(
                padding: EdgeInsets.all(AppSizes.padding.smd),
                itemCount: cart.length,

                // Separator between cart items
                separatorBuilder:
                    (_, __) => SizedBox(height: AppSizes.spacing.betweenItems),

                // Build each cart item
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return CartItemTile(
                    product: item.product,
                    quantity: item.quantity,
                    onIncrease:
                        () => cartNotifier.incrementQuantity(item.product.id),
                    onDecrease:
                        () => cartNotifier.decrementQuantity(item.product.id),
                  );
                },
              ),
    );
  }
}
