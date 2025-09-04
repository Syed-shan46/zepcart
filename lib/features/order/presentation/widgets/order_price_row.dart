import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying order summary cards with expandable product item details.
// Tapping navigates to detailed order information; supports view more/less toggle.
class PriceRow extends StatelessWidget {
  final String label;
  final String amount;

  const PriceRow({super.key, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          '\$$amount',
          style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
