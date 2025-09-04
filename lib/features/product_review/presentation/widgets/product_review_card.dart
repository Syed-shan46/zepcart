import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget that displays a user review including profile image, name, date, rating, and review text.
// Designed for use in product review sections with a clean and readable layout.
class ReviewCard extends StatelessWidget {
  final String name; // Reviewer's name
  final String imageUrl; // Path to reviewer's profile image (Asset)
  final String date; // Date of the review
  final double rating; // Star rating (e.g., 4.5)
  final String review; // Review message

  const ReviewCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Outer wrapper for spacing between review cards
      margin: EdgeInsets.only(bottom: AppSizes.padding.smd),

      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding.sm),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image (Circle)
            CircleAvatar(backgroundImage: AssetImage(imageUrl), radius: AppSizes.borderRadius.xl),
            SizedBox(width: AppSizes.spacing.sm),

            // Review Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Date Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: context.text.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        date,
                        style: TextStyle(color: AppColors.grey, fontSize: AppSizes.font.xs),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.spacing.xs),

                  // Rating Row (Star + Number)
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.accent, size: AppSizes.font.md),
                      SizedBox(width: AppSizes.spacing.xs),
                      Text(rating.toString(), style: AppTextStyles.bodySmall(context)),
                    ],
                  ),
                  SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                  // Review Text
                  Text(review, style: AppTextStyles.bodySmall(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
