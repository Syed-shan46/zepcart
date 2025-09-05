import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/localization/app_strings_home.dart';
import 'package:zepcart/core/common/localization/app_strings_wishlist.dart';
import 'package:zepcart/features/cart/domain/models/cart_model.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:zepcart/shared/widgets/overlays/app_snackbar.dart';

class AppEventListener {
  // Listen to Wishlist Events
  static void listenWishlist(BuildContext context, WidgetRef ref) {
    ref.listen<WishlistStatus?>(wishlistEventProvider, (previous, next) {
      if (next == null) return;

      switch (next) {
        case WishlistStatus.added:
          AppSnackbar.show(
            context,
            message: AppStringsWishlist.addedWishlist,
            icon: Icons.favorite,
            backgroundColor: AppColors.favorite,
          );
          break;

        case WishlistStatus.alreadyExists:
          AppSnackbar.show(
            context,
            message: AppStringsWishlist.alreadyAdded,
            icon: Iconsax.info_circle,
            backgroundColor: AppColors.warning,
          );
          break;

        case WishlistStatus.removed:
          AppSnackbar.show(
            context,
            message: AppStringsWishlist.removedWishlist,
            icon: Icons.heart_broken,
            backgroundColor: AppColors.favorite,
          );
          break;
      }
    });
  }

  // Listen to Cart Events
  static void listenCart(BuildContext context, WidgetRef ref) {
    ref.listen<List<CartItem>>(cartProvider, (previous, next) {
      if (previous == null) return;

      // Case 1: Item added → cart length increased
      if (next.length > previous.length) {
        AppSnackbar.show(
          context,
          message: AppStringsHome.cartAdded,
          icon: Iconsax.shopping_cart,
          backgroundColor: AppColors.success,
        );
      }
    });
  }

  // Attach all app-wide event listeners
  static void listenAll(BuildContext context, WidgetRef ref) {
    listenWishlist(context, ref);
    listenCart(context, ref);
  }
}
