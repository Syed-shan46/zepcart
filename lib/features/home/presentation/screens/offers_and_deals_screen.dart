import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_home.dart';
import 'package:zepcart/features/home/presentation/providers/product_provider.dart';
import 'package:zepcart/features/home/presentation/widgets/offers_deal_grid.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/banners/app_banner_slider.dart';
import 'package:zepcart/shared/widgets/headers/app_section_header.dart';
import 'package:zepcart/shared/widgets/shimmers/product_card_shimmer.dart';

class OffersAndDealsScreen extends ConsumerWidget {
  const OffersAndDealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);

    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsHome.offersAndDealsTitle),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Slider
            AppBannerSlider(),
            SizedBox(height: AppSizes.spacing.lg),

            AppSectionHeader(title: AppStringsHome.topDeals, seeAllBtn: false),
            SizedBox(height: AppSizes.spacing.md),

            // Offers and Deals Grid
            Expanded(
              child: productsAsync.when(
                data: (products) => OffersDealGrid(products: products),
                // Reusable ProductCardShimmer
                loading: () => const Center(child: ProductCardShimmer()),
                error:
                    (error, stack) =>
                        Center(child: Text(AppStringsHome.errorText)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
