import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/features/product_detail/presentation/screens/product_detail_screen.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A reusable card widget that displays product information.
class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate to product detail page when tapped
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      // Main card container
      child: Card(
        elevation: 0,
        color: AppColors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image section
            _buildProductImage(context),

            SizedBox(height: AppSizes.spacing.xs),

            // Product rating (stars + score)
            _buildProductRating(context),

            // Product title
            _buildProductTitle(context),

            // Product price
            _buildProductPrice(context),
          ],
        ),
      ),
    );
  }

  /// Builds the product image with rounded corners.
  /// Falls back to a placeholder if the image fails to load.
  Container _buildProductImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        child: Image.network(
          product.images.first,
          height: 120,
          width: double.infinity,
          fit: BoxFit.contain,
          // Placeholder for broken or missing images
          errorBuilder:
              (context, error, stackTrace) => Container(
                height: 100,
                width: double.infinity,
                color: AppColors.grey300,
                child: const Icon(Icons.broken_image, size: 40),
              ),
        ),
      ),
    );
  }

  /// Builds the product rating with stars and a numeric score.
  Row _buildProductRating(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: product.rating.rate, // Average rating from API
          itemBuilder:
              (context, index) => Icon(Icons.star, color: AppColors.accent),
          itemCount: 5,
          itemSize: AppSizes.icon.sm,
          unratedColor: AppColors.grey300,
          direction: Axis.horizontal,
        ),
        SizedBox(width: AppSizes.spacing.xs),
        Text(
          product.rating.rate.toStringAsFixed(1),
          style: AppTextStyles.bodySmall(context),
        ),
      ],
    );
  }

  /// Builds the product title with text overflow handling.
  Padding _buildProductTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.xs / 2),
      child: Text(
        product.title,
        style: context.text.bodySmall?.copyWith(
          color: context.colors.onSurface,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Builds the product price with styling.
  Row _buildProductPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: context.text.titleSmall?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
