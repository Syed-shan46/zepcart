import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget displaying a summarized view of an ordered product with image, name, size, quantity, and price.
// Designed for order confirmation or history screens to showcase individual ordered items.
class OrderedItems extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  const OrderedItems({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.imageRadius),
          child: Image.network(
            product.images.first,
            width: 45,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: AppSizes.spacing.betweenItems),
    
        // Product Info
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Item Name
              Text(product.title, style: AppTextStyles.bodyMedium(context)),
              SizedBox(height: AppSizes.spacing.xs),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price: ${product.price}'),
    
                  // Quanity
                  Text("Qty : $quantity"),
                  SizedBox(height: AppSizes.spacing.xs),
    
                  // Price
                  Text(
                    (product.price * quantity).toStringAsFixed(2),
                    style: context.text.bodyMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

