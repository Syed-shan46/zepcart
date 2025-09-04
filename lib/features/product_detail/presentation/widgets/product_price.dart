import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying a fixed bottom bar with product price and an "Add to Cart" button.
// Designed for product detail screens to facilitate quick purchase actions.
class ProductPrice extends StatelessWidget {
  final double price;

  const ProductPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$999.00',
          style: context.text.bodySmall?.copyWith(
            color: AppColors.error,
            decoration: TextDecoration.lineThrough,
            decorationThickness: 2,
            decorationColor: AppColors.error,
          ),
        ),
        SizedBox(width: AppSizes.spacing.sm),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: context.text.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }
}
