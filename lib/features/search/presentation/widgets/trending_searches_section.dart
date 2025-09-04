import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/data/trending_searches_data.dart';
import 'package:zepcart/routes/app_routes.dart';

// A Flutter widget displaying a list of trending search keywords as tappable chips.
// Allows users to quickly navigate to popular search results by tapping a chip.
class TrendingSearchesSection extends StatelessWidget {
  const TrendingSearchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(AppStringsSearch.trendingNow, style: context.text.titleMedium),
        SizedBox(height: AppSizes.spacing.betweenItems),

        // Display trending keywords as ActionChips
        Wrap(
          spacing: AppSizes.spacing.sm,
          children:
              trendingSearches
                  .map(
                    (text) => ActionChip(
                      // Styling for chip border and corners
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
                        side: BorderSide(color: context.colors.outline, width: 1),
                      ),
                      label: Text(text),

                      // Navigate to search results screen on tap
                      onPressed: () => Get.toNamed(AppRoutes.searchResults),
                    ),
                  )
                  .toList(),
        ),

        SizedBox(height: AppSizes.spacing.betweenItems),
      ],
    );
  }
}
