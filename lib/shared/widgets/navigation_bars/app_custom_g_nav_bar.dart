import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_navigation.dart';
import 'package:zepcart/core/controllers/bottom_nav_controller.dart';

// A custom bottom navigation bar built with the google_nav_bar package using GetX for state management.
// Features animated tab transitions with gradient backgrounds and reactive screen content updates.
class AppCustomGNavBar extends StatefulWidget {
  const AppCustomGNavBar({super.key});

  @override
  State<AppCustomGNavBar> createState() => _GoogleNavState();
}

class _GoogleNavState extends State<AppCustomGNavBar> {
  // Inject BottomNavController using GetX
  final BottomNavController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        // Bottom Nav using GNav inside padding
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(AppSizes.padding.page),
          child: GNav(
            gap: 8,
            padding: EdgeInsets.all(AppSizes.padding.sm),
            selectedIndex: controller.selectedIndex.value,
            onTabChange: controller.changeTabIndex,

            // Active icon text color
            activeColor: AppColors.white.withAlpha(204),

            // Background gradient for selected tab
            tabBackgroundGradient: LinearGradient(
              colors: [
                context.colors.primary.withAlpha(128),
                context.colors.primary.withAlpha(229),
              ],
            ),

            // Bottom Nav tabs
            tabs: const [
              GButton(icon: Iconsax.home_2, text: AppStringsNavigation.home),
              GButton(icon: Iconsax.shop, text: AppStringsNavigation.cart),
              GButton(icon: CupertinoIcons.heart, text: AppStringsNavigation.wishlist),
              GButton(icon: CupertinoIcons.gear_alt_fill, text: AppStringsNavigation.settings),
            ],
          ),
        ),

        // Display selected tab screen
        body: controller.screens[controller.selectedIndex.value],
      );
    });
  }
}
