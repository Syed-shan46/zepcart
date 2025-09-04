
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/widgets/loading/app_shimmer_widget.dart';

// A shimmer placeholder widget used for banner loading states.
// Displays a rectangular shimmer effect with rounded corners.
class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      width: double.infinity,
      child: AppShimmerWidget(
        shimmerWidth: double.infinity.h,
        shimmerHeight: 125.h,
        shimmerRadius: AppSizes.borderRadius.md,
      ),
    );
  }
}
