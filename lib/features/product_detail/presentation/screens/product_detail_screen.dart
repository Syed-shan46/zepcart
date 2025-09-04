import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_home.dart';
import 'package:zepcart/core/common/localization/app_strings_product.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/features/home/presentation/widgets/recommended_products_list.dart';
import 'package:zepcart/features/product_detail/data/product_detail_data.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/product_bottombar.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/product_image_preview.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/rating_and_review.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/product_price.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/headers/app_section_header.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  String selectedSize = 'M';
  String selectedColor = 'Sky blue';
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    // Default to the first product image on load
    selectedImage = productImages.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom action bar → shows Add to Cart + Price
      bottomNavigationBar: ProductBottomBar(
        product: widget.product,
        onAddToCart: () {
          final cartNotifier = ref.read(cartProvider.notifier);
          final inCart = cartNotifier.isInCart(widget.product.id);
          if (inCart) {
            // Navigate to cart if already added
            Get.toNamed(AppRoutes.cart);
          } else {
            // Otherwise, add to cart
            cartNotifier.addToCart(widget.product);
          }
        },
        price: widget.product.price,
      ),

      body: CustomScrollView(
        slivers: [
          // Product Image Gallery
          SliverToBoxAdapter(
            child: ProductDetailImages(
              images: productImages,
              product: widget.product,
            ),
          ),

          // Product Info Section
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Title
                    Text(
                      widget.product.title,
                      style: AppTextStyles.heading3(context),
                    ),

                    // Product Price
                    ProductPrice(price: widget.product.price),
                    SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                    // Rating & Review row
                    RatingAndReview(),
                    SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                    // Product Description
                    Text(
                      AppStringsProduct.descriptionText1 +
                          AppStringsProduct.descriptionText2,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.spacing.betweenItems),

              // Recommended Products Section
              AppSectionHeader(title: AppStringsHome.recommended),
              SizedBox(height: AppSizes.spacing.xs),
              RecommendedProductsList(),
            ]),
          ),
        ],
      ),
    );
  }
}
