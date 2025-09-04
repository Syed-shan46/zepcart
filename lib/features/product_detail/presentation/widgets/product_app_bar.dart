import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget providing a reusable app bar for product detail screens with back and cart buttons.
// Positioned at the top with themed circular icon buttons for navigation.
class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: AppSizes.padding.md,
      right: AppSizes.padding.md,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Arrow
          CircleAvatar(
            backgroundColor: context.colors.surfaceContainerHigh,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Get.back(),
            ),
          ),

          // Cart Icon
          CircleAvatar(
            backgroundColor: context.colors.surfaceContainerHigh,
            child: IconButton(
              icon: const Icon(Iconsax.shopping_bag, color: AppColors.white),
              onPressed: () {
                // Navigate to cart
              },
            ),
          ),
        ],
      ),
    );
  }
}
