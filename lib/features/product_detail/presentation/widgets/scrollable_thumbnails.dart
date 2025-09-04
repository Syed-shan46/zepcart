import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying a vertically scrollable list of product image thumbnails.
// Allows tapping a thumbnail to preview the selected product image in detail.
class ScrollableThumbnails extends StatelessWidget {
  const ScrollableThumbnails({
    super.key,
    required this.productImages,
    required this.isDarkmode,
    required this.onThumbnailTap,
  });

  // List of product image paths (e.g., asset paths).
  final List<String> productImages;

  // Flag indicating dark mode (currently unused but can be used for theming).
  final bool isDarkmode;

  // Callback when a thumbnail is tapped.
  final ValueChanged<String> onThumbnailTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:
          1, // Takes 1/4th width in parent Row (when paired with image preview taking 3/4)
      child: SizedBox(
        height: 225.h, // Height of the scrollable thumbnail section
        child: ListView.separated(
          itemCount: productImages.length,
          separatorBuilder:
              (context, index) => SizedBox(
                height: AppSizes.padding.sm,
              ), // Gap between thumbnails
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:
                  () => onThumbnailTap(
                    productImages[index],
                  ), // Trigger callback when tapped
              child: Container(
                padding: EdgeInsets.all(AppSizes.padding.xs),
                decoration: BoxDecoration(
                  color:
                      context
                          .colors
                          .surfaceContainerHigh, // Background matches theme surface
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
                  child: Image.network(
                    productImages[index],
                    height: 60, // Thumbnail height
                    fit: BoxFit.cover, // Cover entire box
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
