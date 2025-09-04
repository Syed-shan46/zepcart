import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/widgets/curved_edges.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/features/home/presentation/providers/cart_count_provider.dart';
import 'package:zepcart/features/product_detail/presentation/widgets/product_image_dots.dart';
import 'package:zepcart/features/wishlist/presentation/providers/wishlist_provider.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:badges/badges.dart' as badges;

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
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.cart),
                        child: badges.Badge(
                          showBadge: cartCount > 0,
                          badgeContent: Text(
                            cartCount > 99 ? '99+' : '$cartCount',
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 10.sp,
                              color: AppColors.textWhite,
                            ),
                          ),
                          position: badges.BadgePosition.topEnd(
                            top: -4,
                            end: -4,
                          ),
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: AppColors.favorite,
                            padding: EdgeInsets.all(AppSizes.padding.xs),
                          ),
                          child: Icon(
                            Iconsax.shopping_bag,
                            size: AppSizes.icon.lg,
                          ),
                        ),
                      ),
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

class ProductImageController extends GetxController {
  static ProductImageController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}

class ProductImageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductImageAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, size: 20),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
