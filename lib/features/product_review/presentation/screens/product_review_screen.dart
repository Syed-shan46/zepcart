import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_review.dart';
import 'package:zepcart/features/product_review/presentation/widgets/product_rating_summary.dart';
import 'package:zepcart/features/product_review/presentation/widgets/product_review_list.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsReview.reviewsTitle),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating Summary
            ProductRatingSummary(),
            SizedBox(height: AppSizes.spacing.lg),

            // Review List
            Expanded(child: ProductReviewList()),
            SizedBox(height: AppSizes.spacing.md),

            // Add Review Button
            AppPrimaryButton(
              text: AppStringsReview.writeReview,
              onPressed: () => Get.toNamed(AppRoutes.addReview),
            ),
          ],
        ),
      ),
    );
  }
}
