import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/widgets/loading/app_shimmer_widget.dart';

// A horizontal list of shimmer placeholders used while loading Categories.
class HomeCategoryTileShimmer extends StatelessWidget {
  const HomeCategoryTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.sm),
      child: Column(
        children: [
          // Circular shimmer avatar
          AppShimmerWidget(
            shimmerWidth: 44.w, // match ThemedAvatar size
            shimmerHeight: 44.w,
            shimmerRadius: 45.w / 2, // fully circular
          ),
          SizedBox(height: AppSizes.spacing.xs + AppOffsets.nudgeSM),

          // Title shimmer (small rectangle)
          AppShimmerWidget(
            shimmerWidth: 35.w,
            shimmerHeight: 8.h,
            shimmerRadius: 4,
          ),
        ],
      ),
    );
  }
}
