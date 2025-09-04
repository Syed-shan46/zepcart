import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';

// A Flutter widget serving as a reusable header for filter bottom sheets.
// Displays a title and a tappable "Reset" action to clear filters.

class FilterSheetHeader extends StatelessWidget {
  final VoidCallback? onReset;

  const FilterSheetHeader({super.key, this.onReset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title: "Filter"
        Text(
          AppStringsSearch.filter,
          style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),

        // Reset action (tap to trigger onReset callback)
        GestureDetector(
          onTap: onReset,
          child: Text(
            AppStringsSearch.reset,
            style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
