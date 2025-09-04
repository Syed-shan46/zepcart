import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/widgets/curved_edges.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/widgets/containers/app_circular_container.dart';

// A customizable Flutter AppBar with a curved, gradient background, optional back arrow, and decorative circular elements.
// Supports centered or left-aligned titles and optional child widget for flexible content.
class AppCustomAppBarWithClip extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool isCentered;
  final bool showContainer;
  final double letterSpacing;
  final Widget? child;
  final bool backArrow;

  const AppCustomAppBarWithClip({
    super.key,
    required this.title,
    this.height = 120,
    this.isCentered = true,
    this.showContainer = true,
    this.letterSpacing = 1.5,
    this.child,
    this.backArrow = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        // Curved background using custom clipper
        
        ClipPath(
          clipper: CustomCurvedEdges(),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),

        
        // Back button (optional)
        
        if (backArrow)
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: AppSizes.padding.sm,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

        
        // Decorative circular container (background effect)
        
        if (showContainer)
          Positioned(
            top: -70,
            right: -75,
            child: AppCircularContainer(
              height: 150,
              width: 150,
              color: AppColors.white.withAlpha(25),
            ),
          ),

        
        // Second circular decoration for visual balance
        
        if (showContainer)
          Positioned(
            top: -70,
            right: -25,
            child: AppCircularContainer(
              height: 150,
              width: 150,
              color: AppColors.white.withAlpha(25),
            ),
          ),

        
        // Title or custom content
        
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: AppSizes.padding.md,
          right: AppSizes.padding.md,
          child: Row(
            mainAxisAlignment:
                isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.text.titleLarge?.copyWith(
                  letterSpacing: letterSpacing,
                  fontSize: 18.sp,
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
