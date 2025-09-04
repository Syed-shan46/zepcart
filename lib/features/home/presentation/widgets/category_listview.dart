import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/features/home/presentation/providers/category_list_provider.dart';
import 'package:zepcart/features/home/presentation/widgets/home_category_tile_shimmer.dart';
import 'package:zepcart/features/home/presentation/widgets/home_cateogory_tile.dart';

// A horizontal list of product categories displayed on the home screen.
// This widget listens to the `categoryListProvider` using Riverpod and shows:
class CategoryListView extends ConsumerWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watches the category provider to listen for updates
    final categoriesAsync = ref.watch(categoryListProvider);

    return categoriesAsync.when(
      // Data State: Show categories
      data:
          (categories) => Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.sm),
            child: SizedBox(
              height: 62.h,
              // Displays the list of categories horizontally
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  // A single category tile widget
                  return HomeCategoryTile(category: category);
                },
              ),
            ),
          ),

      // Loading State: Show shimmer
      loading:
          () =>
          // Restricts shimmer list height
          Padding(
            padding: EdgeInsets.only(left: AppSizes.padding.md),
            child: SizedBox(
              height: 60.h,
              // Displays shimmer placeholders horizontally
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, _) => const HomeCategoryTileShimmer(),
              ),
            ),
          ),

      // Error State: Show message
      error:
          (error, stack) =>
          // Centered error message if loading fails
          const Center(child: Text('Error loading categories')),
    );
  }
}
