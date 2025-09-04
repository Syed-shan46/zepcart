import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/helpers/app_event_listener.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

// A Flutter widget displaying a fixed bottom bar with product price and an "Add to Cart" button.
// Designed for product detail screens to facilitate quick purchase actions.
class ProductBottomBar extends ConsumerWidget {
  final double price;
  final ProductModel product;
  final VoidCallback onAddToCart;

  const ProductBottomBar({
    super.key,
    required this.price,
    required this.onAddToCart,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Attach global listeners for wishlist + cart here

    final cart = ref.watch(cartProvider);
    final inCart = cart.any((item) => item.product.id == product.id);

    AppEventListener.listenAll(context, ref);

    return Container(
      height: 80, // Fixed height ensures consistent rendering
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
      decoration: AppBoxDecoration.dynamic(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Price section
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
            ],
          ),

          // Add to Cart Button
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 900,
            ), // smooth transition time
            curve: Curves.easeInOut,
            child: ElevatedButton.icon(
              onPressed: onAddToCart,

              icon: const Icon(Icons.shopping_bag_outlined),
              label: Text(inCart ? "Go to Cart" : "Add to Cart"),
              style: ElevatedButton.styleFrom(
                backgroundColor: inCart
                    ? AppColors.success
                    : context.colors.primary,
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.padding.smd,
                  horizontal: AppSizes.padding.lg,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
