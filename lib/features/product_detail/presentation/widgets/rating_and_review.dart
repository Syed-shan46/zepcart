import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_product.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget displaying a product rating star, numeric rating, and a tappable link to reviews.
// Navigates to the product review screen when 'See Reviews' is tapped.
class RatingAndReview extends StatelessWidget {
  const RatingAndReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Star icon for rating
        Icon(Icons.star, color: AppColors.accent, size: AppSizes.icon.sm),
        SizedBox(width: AppSizes.spacing.xs),

        // Numeric rating text (e.g., 4.5)
        Text('4.5', style: AppTextStyles.bodySmall(context)),
        SizedBox(width: AppSizes.spacing.betweenItemsSmall),

        // Tappable 'See Reviews' text and arrow icon
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.productReview),
          child: Row(
            children: [
              // 'See Reviews' text
              Text(AppStringsProduct.seeReviws, style: AppTextStyles.bodySmall(context)),
              SizedBox(width: AppSizes.spacing.xs / 2),

              // Forward arrow icon
              Icon(Icons.arrow_forward_ios, size: AppSizes.icon.xs, color: AppColors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
