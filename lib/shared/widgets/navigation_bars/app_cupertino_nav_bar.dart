import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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
              icon: Icon(
                selectedIndex == 0 ? Iconsax.home_2 : Iconsax.home,
                size: AppSizes.font.xl,
              ),
              label: AppStringsNavigation.home,
            ),

            // Wishlist Tab
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart, size: AppSizes.font.xl),
              label: AppStringsNavigation.wishlist,
            ),

            // Search Tab
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 2
                    ? Iconsax.receipt_item
                    : Iconsax.receipt_minus,
                size: AppSizes.font.xl,
              ),
              label: AppStringsNavigation.orders,
            ),

            // Profile Tab
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 3 ? Iconsax.setting_2 : Iconsax.setting,
                size: AppSizes.font.xl,
              ),
              label: AppStringsNavigation.settings,
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
