import 'package:flutter/cupertino.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/widgets/cards/product_card.dart';

// A Flutter widget displaying a product card with image, rating, brand, price, and optional discount badge.
// Supports navigation to product details and handles image loading errors gracefully.
class ProductListView extends StatelessWidget {
  final List<ProductModel> products; // Your product model's type

  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.padding.xs,
        vertical: AppSizes.padding.xs,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (_, index) {
        final product = products[index];
        // Reusable ProductCard
        return ProductCard(product: product);
      },
    );
  }
}
