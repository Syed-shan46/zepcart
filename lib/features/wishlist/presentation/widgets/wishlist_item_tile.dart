import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

class WishlistItemTile extends ConsumerWidget {
  final ProductModel product;
  final VoidCallback onRemove;
  final VoidCallback onMoveToCart;

  const WishlistItemTile({
    super.key,
    required this.product,
    required this.onRemove,
    required this.onMoveToCart,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: AppBoxDecoration.dynamic(context),
      padding: EdgeInsets.all(AppSizes.padding.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          Container(
            padding: EdgeInsetsDirectional.all(AppSizes.padding.smd),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
              child: Image.network(
                product.images.first,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 12),

          // Flexible Column for title and price
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min, // prevents extra vertical space
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title
                Text(
                  product.title,
                  style: context.text.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: AppSizes.spacing.xs),

                // Price
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: context.text.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.shopping_cart),
                onPressed: onMoveToCart,
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.delete,
                  color: AppColors.favorite,
                ),
                onPressed: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
