import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/controllers/banner_controller.dart';
import 'package:zepcart/features/home/presentation/providers/banner_list_provider.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/banners/app_banner.dart';
import 'package:zepcart/shared/widgets/shimmers/banner_shimmer.dart';

// A Flutter widget displaying an auto-playing carousel slider of banners with titles and subtitles.
// Includes a dot navigation indicator that reacts to page changes with animated sizing.
class AppBannerSlider extends ConsumerWidget {
  const AppBannerSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = Get.put(BannerController()); // Register controller here

    final bannersAsync = ref.watch(bannerListProvider);

    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.offersAndDeals),
      child: bannersAsync.when(
        
        // Data State: Show banners
        
        data:
            (banners) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    padEnds: true,
                    enlargeCenterPage: true,
                    scrollPhysics: BouncingScrollPhysics(),
                    height: 125.h,
                    viewportFraction: 0.9,
                    onPageChanged:
                        (index, _) => controller.updatePageIndicator(index),
                    autoPlay: true,
                  ),
                  items:
                      banners.map((banner) {
                        return AppBanner(
                          imageUrl: banner.image,
                          title: banner.title,
                          subtitle: banner.subTitle,
                        );
                      }).toList(),
                ),

                
                // Dot indicator for carousel
                
                Positioned(
                  top: 25,
                  right: 35,
                  child: Obx(
                    () => Row(
                      children: List.generate(banners.length, (i) {
                        final isActive =
                            controller.carousalCurrentIndex.value == i;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSizes.spacing.xs,
                          ),
                          width: isActive ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color:
                                isActive
                                    ? context.colors.primary
                                    : AppColors.grey400,
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadius.xl,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),

        
        // ⏳ Loading State: Show shimmer
        
        loading:
            () => CarouselSlider(
              options: CarouselOptions(
                padEnds: true,
                enlargeCenterPage: true,
                scrollPhysics: BouncingScrollPhysics(),
                height: 125.h,
                viewportFraction: 0.9,
                autoPlay: false,
              ),
              items: List.generate(3, (_) => const BannerShimmer()),
            ),

        
        // ❌ Error State: Show message
        
        error: (error, _) => Center(child: Text('Error loading banners')),
      ),
    );
  }
}
