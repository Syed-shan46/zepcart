import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/features/cart/domain/models/cart_model.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';

// Manages the cart state using Riverpod's StateNotifier.
// Provides methods for adding items, updating quantities,
class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  // Add product to cart (or increase quantity if already exists)
  void addToCart(ProductModel product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      incrementQuantity(product.id);
    } else {
      state = [...state, CartItem(product: product, quantity: 1)];
    }
  }

  // Cart count provider (number of items in cart)
  final cartCountProvider = Provider<int>((ref) {
    final cart = ref.watch(cartProvider);
    return cart.fold<int>(0, (count, item) => count + item.quantity);
  });

  // Increase product quantity
  void incrementQuantity(int productId) {
    state = [
      for (final item in state)
        if (item.product.id == productId)
          item.copyWith(quantity: item.quantity + 1)
        else
          item,
    ];
  }

  // Decrease product quantity (remove if it reaches 0)
  void decrementQuantity(int productId) {
    state = [
      for (final item in state)
        if (item.product.id == productId)
          if (item.quantity > 1)
            item.copyWith(quantity: item.quantity - 1)
          else
            null // remove if quantity is 1
        else
          item,
    ].whereType<CartItem>().toList();
  }

  // Remove product from cart
  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  // Calculate total price of all items in the cart
  double get totalPrice => state.fold(
    0,
    (total, item) => total + item.product.price * item.quantity,
  );

  double get subTotal {
    double total = 0;
    for (var item in state) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  // Compute total price including shipping/discount
  double getTotalWithShipping({
    double shippingFee = 10.0,
    double discount = 0.0,
  }) {
    return subTotal + shippingFee - discount;
  }

  // Check if product is already in cart
  bool isInCart(int productId) {
    return state.any((item) => item.product.id == productId);
  }

  // Clear all cart items
  void clearCart() {
    state = [];
  }
}

// Provider for accessing the cart state
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);
