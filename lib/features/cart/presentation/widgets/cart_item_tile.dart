import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

// A Flutter widget used to display a single product item inside the **Cart Screen**.
class CartItemTile extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.dynamic(context),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product image
            Container(
              padding: EdgeInsets.all(AppSizes.padding.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                color:
                    context.isDarkMode
                        ? Colors.grey.shade900
                        : AppColors.backgroundLight,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                child: Image.network(
                  product.images.first,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: AppSizes.spacing.sm),

            // Product info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacing.xs),

                  // Quantity controls
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding.sm,
                      vertical: AppSizes.padding.xs,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                      color:
                          context.isDarkMode
                              ? Colors.grey.shade900
                              : AppColors.backgroundLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Unit price
                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: context.text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Quantity controls
                        Row(
                          children: [
                            // Quantity Decrease
                            _quantityButton(
                              icon: Icons.remove,
                              onTap: onDecrease,
                              context: context,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.spacing.xs,
                              ),
                              child: Text(
                                quantity.toString(),
                                style: context.text.titleMedium,
                              ),
                            ),

                            // Quantity Increase
                            _quantityButton(
                              icon: Icons.add,
                              onTap: onIncrease,
                              context: context,
                            ),
                          ],
                        ),

                        // Total price
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder:
                              (child, animation) => ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                          child: Text(
                            "\$${(product.price * quantity).toStringAsFixed(2)}",
                            style: context.text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          color: context.colors.primary.withAlpha(0),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: AppSizes.font.xl,
          color: context.colors.primary,
        ),
      ),
    );
  }
}
