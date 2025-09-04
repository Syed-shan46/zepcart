import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutState {
  final double shippingFee;
  final double discount;
  final double total;

  CheckoutState({
    required this.shippingFee,
    required this.discount,
    required this.total,
  });

  CheckoutState copyWith({
    double? shippingFee,
    double? discount,
    double? total,
  }) {
    return CheckoutState(
      shippingFee: shippingFee ?? this.shippingFee,
      discount: discount ?? this.discount,
      total: total ?? this.total,
    );
  }
}

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  CheckoutNotifier()
    : super(CheckoutState(shippingFee: 10.0, discount: 0.0, total: 0.0));

  void updateTotal(double cartTotal) {
    final newTotal = cartTotal + state.shippingFee - state.discount;
    state = state.copyWith(total: newTotal);
  }
}

final checkoutProvider = StateNotifierProvider<CheckoutNotifier, CheckoutState>(
  (ref) {
    return CheckoutNotifier();
  },
);
