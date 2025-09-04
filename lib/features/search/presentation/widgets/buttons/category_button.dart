import 'package:flutter/material.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/search_action_button.dart';

// A Flutter widget representing a reusable button to access product categories on the search screen.
// Uses a custom SearchActionButton with category icon and localized label.
class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchActionButton(
      // Callback when the category button is tapped
      onPressed: () {},

      // Icon representing a category
      icon: Icons.category,

      // Label text from localization strings
      label: AppStringsSearch.categories,
    );
  }
}
