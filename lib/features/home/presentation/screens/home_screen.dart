import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_common.dart';
import 'package:zepcart/core/common/localization/app_strings_home.dart';
import 'package:zepcart/features/home/presentation/widgets/category_listview.dart';
import 'package:zepcart/features/home/presentation/widgets/home_header.dart';
import 'package:zepcart/features/home/presentation/widgets/popular_products_list.dart';
import 'package:zepcart/features/home/presentation/widgets/recommended_products_list.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/banners/app_banner_slider.dart';
import 'package:zepcart/shared/widgets/headers/app_section_header.dart';
import 'package:zepcart/shared/widgets/input_fields/app_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top header section with greeting/user icon
                HomeHeader(),
                SizedBox(height: AppSizes.spacing.betweenItems),

                // Search bar
                AppSearchField(),
                SizedBox(height: AppSizes.spacing.betweenItems),

                // Promotional banner carousel
                AppBannerSlider(),
                SizedBox(height: AppSizes.spacing.betweenItems),

                // Category section title with view-all button
                AppSectionHeader(
                  title: AppStringsCommon.categoriesTitle,
                  onTap: () => Get.toNamed(AppRoutes.categoryGrid),
                ),
                SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                // Horizontal list of categories
                CategoryListView(),
                SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                // Popular products title
                AppSectionHeader(title: AppStringsHome.popular),
                // Horizontal list of popular products
                PopularProductsList(),

                // Best for you products title
                AppSectionHeader(title: AppStringsHome.bestForYou),
                // Horizontal list of recommended products
                RecommendedProductsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
