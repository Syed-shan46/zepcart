import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_wishlist.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:zepcart/features/wishlist/presentation/widgets/wishlist_item_tile.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/overlays/app_snackbar.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(wishlistProvider);
    final wishlistNotifier = ref.read(wishlistProvider.notifier);
    final cartNotifier = ref.read(cartProvider.notifier); // 👈 get cart

    return Scaffold(
      // AppBar with Title
      appBar: PrimaryAppbar(title: AppStringsWishlist.wishlistTitle),
      body:
          wishlist.isEmpty
              ? Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppSnackbar.success(context, "Profile updated!");
                    },
                    child: const Text("Show Snackbar"),
                  ),
                  Center(
                    // Empty Wishlist Message
                    child: Lottie.asset(AppImages.notFound, fit: BoxFit.cover),
                  ),
                ],
              )
              : ListView.separated(
                // Separator between cart items
                separatorBuilder:
                    (_, __) => SizedBox(height: AppSizes.spacing.betweenItems),

                itemCount: wishlist.length,

                // Build each wishlit item
                itemBuilder: (context, index) {
                  final product = wishlist[index];
                  return WishlistItemTile(
                    product: product,
                    onRemove:
                        () => wishlistNotifier.removeFromWishlist(
                          product.id.toString(),
                        ),
                    onMoveToCart: () {
                      cartNotifier.addToCart(product); // Add to cart
                      wishlistNotifier.removeFromWishlist(
                        product.id.toString(),
                      ); // 👈 Remove from wishlist
                    },
                  );
                },
              ),
    );
  }
}
