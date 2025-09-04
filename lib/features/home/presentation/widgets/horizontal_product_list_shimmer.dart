import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/widgets/shimmers/product_card_shimmer.dart';

// This can be reused anywhere a product list is being loaded.
// A horizontal list of shimmer placeholders used while loading products.
class HorizontalProductListShimmer extends StatelessWidget {
  const HorizontalProductListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.spacing.sm),
      itemCount: 4,
      separatorBuilder:
          (_, __) => SizedBox(width: AppSizes.spacing.sm + AppOffsets.nudgeMD),
      itemBuilder:
          (context, index) =>
              const SizedBox(width: 160, child: ProductCardShimmer()),
    );
  }
}
