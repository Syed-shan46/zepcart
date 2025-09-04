import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/routes/app_routes.dart';

class OrderChatCancelBtn extends StatelessWidget {
  const OrderChatCancelBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text(AppStringsOrder.cancel),
              icon: Icon(Iconsax.close_circle),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),

          // Chat Now Button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                Get.toNamed(AppRoutes.chatSupport);
              },
              label: Text(
                AppStringsOrder.chatNow,
                style: TextStyle(
                  color: context.isDarkMode ? AppColors.black : AppColors.white,
                ),
              ),
              icon: Icon(
                Iconsax.message,
                color: context.isDarkMode ? AppColors.black : AppColors.white,
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.transparent),
                backgroundColor:
                    context.isDarkMode ? AppColors.white : AppColors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
