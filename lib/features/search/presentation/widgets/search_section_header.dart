import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';

// A Flutter widget for displaying section headers in the search screen with a title and optional trailing action.
// Supports a tappable trailing label like "View All" for navigation or expanded views.
class FilterSheetSectionHeader extends StatelessWidget {
  const FilterSheetSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });

  // Title displayed on the left (e.g. “Recent Searches”)
  final String title;
  // Optional text displayed on the right (e.g. “View All”)
  final String? trailing;
  // Optional callback when trailing text is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Section title
          Text(
            title,
            style: context.text.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp, // Responsive font size
            ),
          ),

          // Optional "See All" or custom trailing label
          if (trailing != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                trailing ?? AppStringsSearch.seeAll,
                style: context.text.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colors.primary, // Uses theme's primary color
                ),
              ),
            ),
        ],
      ),
    );
  }
}
