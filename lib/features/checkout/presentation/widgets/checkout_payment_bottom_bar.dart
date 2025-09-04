import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/checkout/presentation/screens/payment_screen.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

// A bottom bar with a "Place Order" button and total price.
// Integrates with PaymentScreen to trigger order placement on button press.

class CheckoutPaymentBottomBar extends ConsumerWidget {
  const CheckoutPaymentBottomBar({
    super.key,
    required this.widget,
    required this.finalPrice,
  });

  // Accepting the parent PaymentScreen to access its onNext method
  final PaymentScreen widget;
  final double finalPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(AppSizes.padding.md + AppOffsets.nudgeSM),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pay Button to proceed to payment screen
          AppPrimaryButton(
            text:
                "${AppStringsCheckout.totalToPay}: \$${finalPrice.toStringAsFixed(2)}",
            onPressed: widget.onNext,
          ),
        ],
      ),
    );
  }
}
