import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/routes/app_routes.dart';

class AppCartIcon extends StatelessWidget {
  const AppCartIcon({
    super.key,
    required this.cartCount,
  });

  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        position: badges.BadgePosition.topEnd(top: -4, end: -4),
        badgeStyle: badges.BadgeStyle(
          badgeColor: AppColors.favorite,
          padding: EdgeInsets.all(AppSizes.padding.xs),
        ),
        child: Icon(
          Iconsax.shopping_bag_copy,
          size: AppSizes.icon.lg,
        ),
      ),
    );
  }
}
