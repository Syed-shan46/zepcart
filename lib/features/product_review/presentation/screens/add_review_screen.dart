import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_review.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenFormState();
}

class _AddReviewScreenFormState extends State<AddReviewScreen> {
  double rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsReview.leaveReviewScreenTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.md,
          vertical: AppSizes.padding.lg,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  AppStringsReview.leaveReviewHeading,
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spacing.betweenItems),

              // Rating Label
              Center(
                child: Text(
                  AppStringsReview.detailedReviewLabel,
                  style: context.text.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spacing.betweenCategories),

              // Star Rating
              Center(
                child: RatingBar.builder(
                  unratedColor: context.colors.surfaceContainerHigh,
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder:
                      (context, _) => Icon(Icons.star, color: AppColors.accent),
                  onRatingUpdate: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
              ),
              SizedBox(height: AppSizes.spacing.betweenSections),

              // Detailed Review
              Text(
                AppStringsReview.detailedReviewLabel,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.spacing.betweenItemsSmall),

              // Add Review Textfield
              TextField(
                controller: reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: AppStringsReview.reviewHint,
                  filled: true,
                  fillColor: context.colors.surfaceContainerHigh,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spacing.betweenItemsSmall),

              // Add Photo Button
              TextButton.icon(
                onPressed: () {
                  // Implement photo picker
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text(AppStringsReview.addPhoto),
              ),

              // Bottom Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Cancel action
                      },
                      style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                      child: Text(AppStringsReview.cancelButton),
                    ),
                  ),
                  SizedBox(width: AppSizes.spacing.betweenItems),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Submit action
                      },
                      child: Text(AppStringsReview.submitButton),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
