import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/features/search/presentation/widgets/recent_searches_section.dart';
import 'package:zepcart/features/search/presentation/widgets/search_input_bar.dart';
import 'package:zepcart/features/search/presentation/widgets/top_brands_grid.dart';
import 'package:zepcart/features/search/presentation/widgets/trending_searches_section.dart';

// Main search screen where users can input a search term,
// view recent searches, trending keywords, and top brands.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Dummy list of recent search terms
  List<String> recentSearches = [
    'Sneakers',
    'Watches',
    'Bluetooth Headphones',
    'Smartphones',
  ];

  // Clears all recent search items
  void clearRecentSearches() => setState(() => recentSearches.clear());

  // Removes a single item from recent searches
  void removeSearch(String item) => setState(() => recentSearches.remove(item));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar
      appBar: SearchInputBar(),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.md,
          vertical: AppSizes.padding.sm,
        ),

        // Scrollable body containing all sections
        child: ListView(
          children: [
            // Only show recent searches section if the list is not empty
            if (recentSearches.isNotEmpty)
              RecentSearchesSection(
                searches: recentSearches,
                onClear: clearRecentSearches,
                onRemove: removeSearch,
              ),

            // Section displying trending keywords
            TrendingSearchesSection(),

            // Grid view displaying popular brands
            TopBrandsGrid(),
          ],
        ),
      ),
    );
  }
}
