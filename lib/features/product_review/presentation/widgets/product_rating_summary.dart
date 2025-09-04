import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_review.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget showing the distribution of product ratings and the average rating summary.
// Includes star icons, rating bars, and review count for product feedback visualization.
class ProductRatingSummary extends StatefulWidget {
  const ProductRatingSummary({super.key});

  @override
  State<ProductRatingSummary> createState() => _ProductRatingSummaryState();
}

class _ProductRatingSummaryState extends State<ProductRatingSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.padding.md),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
      ),
      child: Row(
        children: [
          // Left: Rating distribution
          Expanded(
            child: Column(
              children: List.generate(5, (index) {
                final stars = 5 - index;
                final value = stars / 5; // replace with actual rating data

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.padding.xs),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('$stars', style: AppTextStyles.bodySmall(context)),
                      SizedBox(width: AppSizes.spacing.xs),
                      Icon(Icons.star, size: AppSizes.font.sm, color: Colors.amber),
                      SizedBox(width: AppSizes.spacing.sm),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(color: context.colors.surfaceContainerLow),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: value.clamp(0.05, 1.0),
                                child: Container(
                                  height: AppSizes.spacing.sm,
                                  color: context.colors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(width: AppSizes.spacing.md),
          // Right: Average rating
          Column(
            children: [
              Text(
                '4.5',
                style: context.text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: AppSizes.spacing.xs),
              RatingBarIndicator(
                rating: 4.0,
                itemBuilder: (context, index) => const Icon(Icons.star, color: AppColors.warning),
                itemSize: 18,
              ),
              SizedBox(height: AppSizes.spacing.xs),
              Text('52 ${AppStringsReview.reviewHint}', style: AppTextStyles.bodyMedium(context)),
            ],
          ),
        ],
      ),
    );
  }
}
