import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/routes/app_routes.dart';

class AppNotificationIcon extends StatelessWidget {
  const AppNotificationIcon({super.key, required this.notificationCount});

  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.notification),
      child: badges.Badge(
        showBadge: notificationCount > 0,
        badgeContent: Text(
          notificationCount > 99 ? '99+' : '$notificationCount',
          style: context.text.bodySmall?.copyWith(
            fontSize: 10.sp,
            color: AppColors.white,
          ),
        ),
        position: badges.BadgePosition.topEnd(top: -4, end: -4),
        badgeStyle: badges.BadgeStyle(
          badgeColor: AppColors.favorite,
          padding: EdgeInsets.all(AppSizes.padding.xs),
        ),
        child: Icon(Iconsax.notification_copy, size: AppSizes.icon.lg),
      ),
    );
  }
}
