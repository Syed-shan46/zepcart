import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/category_button.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/filter_button.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/offers_button.dart';
import 'package:zepcart/features/search/presentation/widgets/buttons/sort_by_button.dart';

// A Flutter widget displaying a horizontally scrollable row of product-related action buttons.
// Includes sort, filter, category, and offers buttons for use in search or product listing screens.
class ProductActionRow extends StatefulWidget {
  const ProductActionRow({super.key});

  @override
  State<ProductActionRow> createState() => _ProductActionRowState();
}

class _ProductActionRowState extends State<ProductActionRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md, vertical: AppSizes.padding.sm),

      // Enables horizontal scrolling in case of small screens
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children: [
            // Sort by Button (opens a bottom sheet to choose sort order)
            SortByButton(),
            SizedBox(width: AppSizes.spacing.betweenItems),

            // Filter Button (opens a bottom sheet with filter options)
            FilterButton(),
            SizedBox(width: AppSizes.spacing.betweenItems),

            // Category Button (intended to show categories - action to be defined)
            CategoryButton(),
            SizedBox(width: AppSizes.spacing.betweenItems),

            // Offers Button (intended to show offers - action to be defined)
            OffersButton(),
          ],
        ),
      ),
    );
  }
}
