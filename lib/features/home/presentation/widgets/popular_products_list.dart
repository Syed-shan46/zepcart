import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/features/home/presentation/providers/product_provider.dart';
import 'package:zepcart/features/home/presentation/widgets/horizontal_product_list_shimmer.dart';
import 'package:zepcart/shared/widgets/cards/product_card.dart';

/// A horizontal list of popular products displayed on the home screen.
/// This widget listens to the `productListProvider` using Riverpod and displays
class PopularProductsList extends StatelessWidget {
  const PopularProductsList({super.key});

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // Fixed height for the product list
      child: Consumer(
        builder: (context, ref, _) {
          // Watch the product list provider
          final productsAsync = ref.watch(productListProvider);

          return productsAsync.when(
            // Data State: Show products
            data:
                (products) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spacing.sm,
                  ),
                  itemCount: 8, // Show only the first 8 products
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return SizedBox(
                      width: 160, // Fixed width for each product card
                      // Reusable ProductCard
                      child: ProductCard(product: product), // Product display card
                    );
                  },
                ),

            // Loading State: Show shimmer
            loading: () => HorizontalProductListShimmer(),

            // Error State: Show mssage
            error: (e, _) => Center(child: Text("Error loading products: $e")),
          );
        },
      ),
    );
  }
}
