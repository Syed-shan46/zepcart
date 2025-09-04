import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';

// Wishlist actions to trigger Snackbars
enum WishlistStatus { added, alreadyExists, removed }

class WishlistNotifier extends StateNotifier<List<ProductModel>> {
  WishlistNotifier(this._ref) : super([]);
  final Ref _ref;

  void addToWishlist(ProductModel product) {
    final eventNotifier = _ref.read(wishlistEventProvider.notifier);

    if (!state.any((p) => p.id == product.id)) {
      state = [...state, product];
      eventNotifier.state = WishlistStatus.added; // ✅ Trigger added event
    } else {
      eventNotifier.state =
          WishlistStatus.alreadyExists; // ✅ Trigger exists event
    }
  }

  void removeFromWishlist(String productId) {
    state = state.where((p) => p.id.toString() != productId).toList();
    _ref.read(wishlistEventProvider.notifier).state =
        WishlistStatus.removed; // ✅ Trigger removed event
  }

  bool isInWishlist(String productId) {
    return state.any((p) => p.id.toString() == productId);
  }
}

/// Wishlist products state
final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, List<ProductModel>>(
      (ref) => WishlistNotifier(ref),
    );

/// Wishlist event state (for Snackbars)
final wishlistEventProvider = StateProvider<WishlistStatus?>((ref) => null);
