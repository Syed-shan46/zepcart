import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget showing a header row with a title and a chevron icon for navigation or expansion actions.
// The chevron is tappable, triggering a callback to handle user interaction.
class CheckoutItemsHeader extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const CheckoutItemsHeader({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Header title text
        Text(
          title,
          style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),

        // Chevron icon to indicate navigation or expansion
        GestureDetector(onTap: onTap, child: Icon(Icons.chevron_right)),
      ],
    );
  }
}
