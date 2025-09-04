import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_home.dart';

// A reusable Flutter widget displaying a section header with a title and an optional "See All" button.
// Ideal for labeling categories, lists, or product sections with customizable tap behavior.
class AppSectionHeader extends StatelessWidget {
  // Main title of the section
  final String title;
  // Optional callback when "See All" is tapped
  final VoidCallback? onTap;
  // Controls whether the "See All" button is shown
  final bool seeAllBtn;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.onTap,
    
    this.seeAllBtn = true, // Default: show the button
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between title and "See All"
        children: [
          
          //  Section Title
          
          Text(
            title,
            style: context.text.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp, // Responsive font size using screenutil
            ),
          ),

          
          //  Optional "See All" Button
          
          if (seeAllBtn)
            GestureDetector(
              onTap: onTap, // Triggers the passed callback when tapped
              child: Text(
                AppStringsHome.seeAll,
                style: context.text.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: context.colors.primary, // Uses theme primary color
                ),
              ),
            ),
        ],
      ),
    );
  }
}
