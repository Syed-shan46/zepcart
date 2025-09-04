import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/widgets/loading/app_shimmer_widget.dart';

// This widget is useful for providing a visual cue to the user that content is loading,
// maintaining a consistent visual structure before the actual data is displayed.
class ProductCardShimmer extends StatelessWidget {
  final bool setWidth;

  const ProductCardShimmer({super.key, this.setWidth = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setWidth ? 150.w : null,
      child: Card(
        color: AppColors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.card.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmering image container
            AppShimmerWidget(
              shimmerWidth: double.infinity,
              shimmerHeight: 75.h,
            ),

            SizedBox(height: AppSizes.spacing.xs),

            // Shimmering rating bar and reviews
            Row(
              children: [
                AppShimmerWidget(shimmerWidth: 75.w, shimmerHeight: 14.h),
                SizedBox(width: AppOffsets.nudgeSM),
                AppShimmerWidget(shimmerWidth: 30.w, shimmerHeight: 14.h),
              ],
            ),

            SizedBox(height: AppSizes.spacing.xs),
            // Shimmering product title
            AppShimmerWidget(
              shimmerWidth: double.infinity,
              shimmerHeight: 23.h,
            ),

            SizedBox(height: AppSizes.spacing.xs),
            // Shimmering price section
            AppShimmerWidget(shimmerWidth: 60.w, shimmerHeight: 14.h),
          ],
        ),
      ),
    );
  }
}
