import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_navigation.dart';
import 'package:zepcart/core/utils/device_utility.dart';
import 'package:zepcart/features/home/presentation/providers/cart_count_provider.dart';
import 'package:zepcart/shared/widgets/icons/app_cart_icon.dart';
import 'package:zepcart/shared/widgets/icons/app_notification_icon.dart';

// A Flutter widget displaying the home screen header with a welcome message and user name.
// Includes cart and notification icons with dynamic badges and navigation callbacks.
class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int notificationCount = 5;
    final cartCount = ref.watch(cartCountProvider); // watch cart count
    final topPadding = AppDeviceUtils.getStatusBarHeight(context) + 3;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.padding.md,
        top: topPadding,
        right: AppSizes.padding.md,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // Welcome texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStringsNavigation.homeHeaderDealsTitle,
                  style: context.text.titleMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Username
                Text(
                  'Syed-shan', // Consider making this dynamic (from user profile/provider)
                  style: context.text.titleSmall?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            // Notification icon with badge
            Positioned(
              right: 40,
              top: 10,
              child: AppNotificationIcon(notificationCount: notificationCount),
            ),

            // Cart icon with badge
            Positioned(
              right: 0,
              top: 10,
              child: AppCartIcon(cartCount: cartCount),
            ),
          ],
        ),
      ),
    );
  }
}
