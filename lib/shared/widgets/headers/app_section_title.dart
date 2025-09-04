import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A simple Flutter widget displaying a bold section title text.
// Intended for use as headings like "Billing Info", "Payment Method", etc.
class AppSectionTitle extends StatelessWidget {
  // The text displayed as the section title
  final String title;

  const AppSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.text.titleSmall?.copyWith(
        fontWeight: FontWeight.bold, // Makes the title visually strong
      ),
    );
  }
}
