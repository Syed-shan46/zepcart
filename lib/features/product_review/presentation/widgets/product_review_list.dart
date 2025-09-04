import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/product_review/data/review_data.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget displaying a vertically scrollable list of user product reviews.
// Each review shows avatar, username, star rating, time ago, comment, and a more options icon.
class ProductReviewList extends StatefulWidget {
  const ProductReviewList({super.key});

  @override
  State<ProductReviewList> createState() => _ProductReviewListState();
}

class _ProductReviewListState extends State<ProductReviewList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: sampleReviews.length,

      // Adds spacing between each review item
      separatorBuilder: (_, __) => SizedBox(height: AppSizes.spacing.betweenItems),

      itemBuilder: (context, index) {
        final review = sampleReviews[index]; // Get review from sample data

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reviewer Profile Avatar
            CircleAvatar(
              backgroundImage: AssetImage(review.avatarUrl),
              radius: 22,
              backgroundColor: context.colors.surfaceContainerHigh,
            ),
            SizedBox(width: AppSizes.spacing.sm),

            // Review Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Wrap name, rating bar, time, and comment
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User Name
                            Text(
                              review.user,
                              style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: AppSizes.spacing.xs),

                            // Rating Stars + Time Ago
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: review.rating,
                                  itemBuilder:
                                      (_, __) => const Icon(Icons.star, color: AppColors.warning),
                                  itemSize: 14,
                                ),
                                SizedBox(width: AppSizes.spacing.sm),
                                Text(review.timeAgo, style: AppTextStyles.bodySmall(context)),
                              ],
                            ),
                            SizedBox(height: AppSizes.spacing.xs),

                            // Review Comment Text
                            Text(review.comment, style: AppTextStyles.bodySmall(context)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.spacing.xs),
                ],
              ),
            ),

            // More Options Icon
            Icon(Icons.more_vert, size: AppSizes.font.md),
          ],
        );
      },
    );
  }
}
