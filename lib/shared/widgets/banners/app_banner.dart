import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_home.dart';

// A Flutter widget displaying a styled banner with background image, gradient overlay, and optional title, subtitle, and claim button.
// Supports error handling for missing images and customizable text styles for content overlay.
class AppBanner extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? subtitle;
  final VoidCallback? onClaim;

  const AppBanner({
    super.key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
      child: Stack(
        children: [
          
          // Background Image
          
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter, // ⬅️ Shift image upward
            width: double.infinity,
            height: 180,
            errorBuilder:
                (_, __, ___) => Container(
                  height: 180,
                  color: AppColors.grey,
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image),
                ),
          ),

          
          // Full Gradient Overlay
          
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black.withAlpha(AppOpacities.lowOpaque),
                  AppColors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          
          // Combined Text + Button Row
          
          if (title != null || subtitle != null)
            Positioned(
              left: AppSizes.padding.md,
              right: AppSizes.padding.md,
              bottom: AppSizes.padding.md + AppOffsets.nudgeXS,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  // Title + Subtitle
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: context.text.titleMedium?.copyWith(
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: context.text.bodySmall?.copyWith(
                              color: AppColors.grey200,
                            ),
                          ),
                      ],
                    ),
                  ),

                  
                  // Claim Button
                  
                  Container(
                    margin: EdgeInsets.only(left: AppSizes.spacing.sm),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding.smd,
                      vertical: AppSizes.padding.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      borderRadius: BorderRadius.circular(
                        AppSizes.buttonRadius,
                      ),
                    ),
                    child: Text(
                      AppStringsHome.claim,
                      style: context.text.bodySmall?.copyWith(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
