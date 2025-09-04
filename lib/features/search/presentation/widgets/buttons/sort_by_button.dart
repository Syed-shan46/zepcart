import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/search_action_button.dart';
import 'package:zepcart/features/search/presentation/widgets/sheets/sort_by_sheet.dart';

// A Flutter widget representing a button that opens a modal bottom sheet for sorting search results.
// Shows predefined sort options and allows selection with UI update on change.
class SortByButton extends StatefulWidget {
  const SortByButton({super.key});

  @override
  State<SortByButton> createState() => _SortByButtonState();
}

class _SortByButtonState extends State<SortByButton> {
  // Tracks the currently selected sort option
  String _selectedSort = "Price: Low to High";

  // Opens the bottom sheet to select a sort option
  void _openSortBySheet() {
    // Predefined sort options for display
    final options = [
      'Recommended',
      'Recently added',
      'Price: Low to High',
      'Price: High to Low',
      'Top rated',
    ];

    // Show bottom sheet modal for sorting options
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.borderRadius.md)),
      ),
      builder:
          (context) => SortBySheet(
            options: options,
            selectedOption: _selectedSort,
            onChanged: (value) {
              // Update the selected sort value and refresh UI
              setState(() {
                _selectedSort = value;
              });
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchActionButton(
      onPressed: _openSortBySheet,
      icon: Icons.sort,
      label: AppStringsSearch.sortBy,
    );
  }
}
