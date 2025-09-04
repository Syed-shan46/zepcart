import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/search_action_button.dart';
import 'package:zepcart/features/search/presentation/widgets/sheets/filter_bottom_sheet.dart';

// A Flutter widget representing a button that opens a modal bottom sheet for filtering search results.
// Uses a custom SearchActionButton with filter icon and localized label.
class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return SearchActionButton(
      // Tapping this opens the bottom filter sheet
      onPressed: _openFilterSheet,
      icon: Icons.filter_list,

      // Localized label "Filter"
      label: AppStringsSearch.filter,
    );
  }

  // Opens a modal bottom sheet with filtering options
  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes sheet take full height if needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.borderRadius.md)),
      ),

      // Displays the FilterBottomSheet widget
      builder: (context) => const FilterBottomSheet(),
    );
  }
}
