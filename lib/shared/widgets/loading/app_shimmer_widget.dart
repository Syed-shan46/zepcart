import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';

// Reusable shimmer widget for displaying skeleton loaders during asynchronous data fetch.
// Adapts colors for light and dark themes, suitable for loading product, order, and list items.
class AppShimmerWidget extends StatelessWidget {
  const AppShimmerWidget({
    super.key,
    required this.shimmerWidth,
    required this.shimmerHeight,
    this.shimmerRadius = 6,
  });

  final double shimmerWidth;
  final double shimmerHeight;
  final double shimmerRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: shimmerWidth,
      height: shimmerHeight,

      child: _buildShimmerLine(
        isDarkMode: context.isDarkMode,
        height: shimmerHeight,
        width: shimmerWidth,
        radius: shimmerRadius,
      ),
    );
  }

  Widget _buildShimmerLine({
    required double height,
    required double width,
    required double radius,
    required bool isDarkMode,
  }) {
    return Shimmer.fromColors(
      baseColor: isDarkMode ? AppColors.grey800 : AppColors.grey300,
      highlightColor: isDarkMode ? AppColors.grey700 : AppColors.grey100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
