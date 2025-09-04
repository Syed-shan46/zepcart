import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget displaying a row with product image, title, quantity, and price for checkout items.
// Styled with rounded images and responsive text styles for clear presentation.
class CheckoutItemTile extends StatelessWidget {
  final ProductModel product;
  final int quantity;

  const CheckoutItemTile({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product image with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
          child: Image.network(
            product.images.first,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: AppSizes.spacing.sm),

        // Product details (title and quantity)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product title
              Text(product.title, style: AppTextStyles.bodyMedium(context)),
              SizedBox(height: AppSizes.spacing.sm),

              // Quantity label
              Text(
                '${AppStringsCheckout.qty} $quantity',
                style: AppTextStyles.bodyMedium(context),
              ),
            ],
          ),
        ),

        // Product price
        Text(
          product.price.toString(),
          style: AppTextStyles.bodyMedium(context),
        ),
      ],
    );
  }
}
