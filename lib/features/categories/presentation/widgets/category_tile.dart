import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/features/categories/domain/models/category_model.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

// A Flutter widget for displaying product categories with an image and title in a tappable container.
// Designed for use in grids or lists on the home screen with responsive styling and dynamic decoration.
class CategoryTile extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryTile({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.padding.smd),
      child: Container(
        padding: EdgeInsets.all(AppSizes.padding.smd),
        decoration: AppBoxDecoration.dynamic(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Category image
            Image.network(
              category.imageUrl,
              height: 48,
              fit: BoxFit.contain,
              semanticLabel: category.title,
            ),
            SizedBox(height: AppSizes.spacing.betweenItemsSmall),

            // Category title
            Text(
              category.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
