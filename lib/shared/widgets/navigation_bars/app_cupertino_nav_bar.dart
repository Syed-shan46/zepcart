import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_navigation.dart';
import 'package:zepcart/core/controllers/bottom_nav_controller.dart';

// A Cupertino-style bottom navigation bar implemented with GetX for reactive state management.
// Provides tab navigation with icons and labels for Home, Search, Wishlist, and Profile screens.
class AppCupertinoBottomNav extends StatelessWidget {
  // Inject the BottomNavController from GetX
  final BottomNavController controller = Get.find();

  AppCupertinoBottomNav({super.key});

  // Uncomment and use this if you plan to use custom SVG icons
  // Widget _buildSvgIcon(String filled, String outline, bool isSelected) {
  //   return SvgPicture.asset(
  //     isSelected ? filled : outline,
  //     width: AppSizes.icon.lg,
  //     height: AppSizes.icon.lg,
  //     colorFilter: ColorFilter.mode(
  //       isSelected ? AppColors.primary : AppColors.grey,
  //       BlendMode.srcIn,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Rebuild when the selectedIndex changes
      final selectedIndex = controller.selectedIndex.value;

      return CupertinoTabScaffold(
        // Bottom navigation bar
        tabBar: CupertinoTabBar(
          currentIndex: selectedIndex,
          onTap: controller.changeTabIndex,
          items: [
            // Home Tab
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home, size: AppSizes.font.xl),
              label: AppStringsNavigation.home,
            ),

            // Search Tab
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_favorite, size: AppSizes.font.xl),
              label: AppStringsNavigation.search,
            ),

            // Wishlist Tab
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart, size: AppSizes.font.xl),
              label: AppStringsNavigation.wishlist,
            ),

            // Profile Tab
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: AppSizes.font.xl),
              label: AppStringsNavigation.profile,
            ),
          ],
        ),

        // Builds the screen associated with the selected tab
        tabBuilder: (context, index) {
          return controller.screens[index];
        },
      );
    });
  }
}
