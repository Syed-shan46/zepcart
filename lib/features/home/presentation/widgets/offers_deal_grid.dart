import 'package:flutter/material.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/shared/widgets/cards/product_card.dart';
import 'package:zepcart/shared/widgets/list/app_grid_view.dart';

// A reusable grid widget used to display products under the "Offers & Deals"
class OffersDealGrid extends StatelessWidget {
  final List<ProductModel> products;
  const OffersDealGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // Using reusable AppGridView widget
    return AppGridView(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        // Reusable ProductCard
        return ProductCard(product: product);
      },
    );
  }
}
