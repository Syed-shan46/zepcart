import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';

// Cart count provider (number of items in cart)
final cartCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold<int>(0, (count, item) => count + item.quantity);
});
