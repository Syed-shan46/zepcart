import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/widgets/curved_edges.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/features/home/presentation/providers/cart_count_provider.dart';
import 'package:zepcart/features/product_detail/domain/controllers/product_image_controller.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/product_image_app_bar.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/product_image_dots.dart';
import 'package:zepcart/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/icons/app_cart_icon.dart';

class ProductDetailImages extends ConsumerStatefulWidget {
  const ProductDetailImages({
    super.key,
    required this.images,
    //required this.controller,
    required this.product,
  });

  final List<String> images;
  final ProductModel product;
  // final HomeController controller;

  @override
  ConsumerState<ProductDetailImages> createState() =>
      _ProductDetailImagesState();
}

class _ProductDetailImagesState extends ConsumerState<ProductDetailImages> {
  final controller = Get.put(ProductImageController());

  @override
  Widget build(BuildContext context) {
    final wishlist = ref.watch(wishlistProvider);
    final wishlistNotifier = ref.read(wishlistProvider.notifier);
    final isWishlisted = wishlist.any((p) => p.id == widget.product.id);

    final cartCount = ref.watch(cartCountProvider); // watch cart count

    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.imageView);
        },
        child: Container(
          color: AppColors.grey.withAlpha(AppOpacities.veryLowOpaque),
          child: Stack(
            children: [
              // Carousel Slider positioned at the base of the stack
              CarouselSlider(
                items: widget.images.map((imagePath) {
                  return Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 350.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
              ),

              // Positioning the AppBar above the CarouselSlider
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ProductImageAppBar(
                  showBackArrow: true,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        child: IconButton(
                          // Riverpod-driven toggle: instantly adds/removes the current product from the wishlist.
                          onPressed: () {
                            isWishlisted
                                ? wishlistNotifier.removeFromWishlist(
                                    widget.product.id.toString(),
                                  )
                                : wishlistNotifier.addToWishlist(
                                    widget.product,
                                  );
                          },
                          // Icon's visual state (filled/outlined, red/grey) is directly computed from watched wishlist state.
                          icon: Icon(
                            isWishlisted
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isWishlisted ? AppColors.favorite : null,
                          ),
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: AppSizes.padding.smd),
                      child: AppCartIcon(cartCount: cartCount),
                    ),
                  ],
                ),
              ),

              // Dot navigation at the bottom of the image
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: ProductImageDots(
                  controller: controller,
                  dotCount: widget.images.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
