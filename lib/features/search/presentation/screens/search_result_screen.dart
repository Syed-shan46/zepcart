import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/home/presentation/providers/product_provider.dart';
import 'package:zepcart/features/search/presentation/widgets/product_action_row.dart';
import 'package:zepcart/features/search/presentation/widgets/searchbar_with_back_button.dart';
import 'package:zepcart/shared/widgets/cards/product_list_view.dart';

// Screen that displays the search results with sorting, filtering, and product list.
class SearchResultsScreen extends ConsumerWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);

    return Scaffold(
      body: SafeArea(
        // Use ListView to allow vertical scrolling of the entire screen content
        child: productsAsync.when(
          data:
              (products) => ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  // Spacing from top edge
                  SizedBox(height: AppSizes.spacing.sm),

                  // Custom search bar with a back button
                  SearchBarWithBackButton(
                    hintText: AppStringsSearch.recentSearches,
                  ),
                  SizedBox(height: AppSizes.spacing.md),

                  // Row with sort and filter actions (e.g., sort by price, filter by category)
                  ProductActionRow(),

                  // List of searched products in card/list layout
                  ProductListView(products: products),
                ],
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error loading products')),
        ),
      ),
    );
  }
}
