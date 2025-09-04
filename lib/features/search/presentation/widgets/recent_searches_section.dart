import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';

// A Flutter widget displaying a list of recent search keywords as chips with clear and remove options.
// Includes a header with title and a "Clear All" button to reset all recent searches.
class RecentSearchesSection extends StatelessWidget {
  // List of search terms to display
  final List<String> searches;

  final VoidCallback onClear;
  // Called when a single search item is removed
  final void Function(String) onRemove;

  const RecentSearchesSection({
    super.key,
    required this.searches,
    required this.onClear,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row with title and clear action
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStringsSearch.recentSearches, style: context.text.titleMedium),
            TextButton(onPressed: onClear, child: const Text(AppStringsSearch.clearAll)),
          ],
        ),

        // Wrap of chips (search terms)
        Wrap(
          spacing: AppSizes.spacing.sm,
          children:
              searches
                  .map(
                    (text) => Chip(
                      // Adds a border around the chip
                      side: BorderSide(color: context.colors.outline),
                      label: Text(text),

                      // Show 'X' button to delete the chip
                      onDeleted: () => onRemove(text),
                    ),
                  )
                  .toList(),
        ),

        // Adds spacing below the section
        SizedBox(height: AppSizes.spacing.betweenItems),
      ],
    );
  }
}
