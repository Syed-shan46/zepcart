import 'package:flutter/cupertino.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';

// A Flutter widget displaying a labeled order summary row with amount aligned right.
// Supports optional bold styling for emphasis on important totals.
class CheckoutOrderSummary extends StatelessWidget {
  // Label on the left side (e.g., "Subtotal", "Shipping", "Total")
  final String label;
  // Amount on the right side (e.g., "$29.99")
  final String amount;
  // Whether the text should be bold
  final bool isBold;

  const CheckoutOrderSummary({
    super.key,
    required this.label,
    required this.amount,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Vertical spacing around each row item
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding.xs),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between label and amount
        children: [
          // Left-side label text
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),

          // Right-side amount text
          Text(
            amount,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
