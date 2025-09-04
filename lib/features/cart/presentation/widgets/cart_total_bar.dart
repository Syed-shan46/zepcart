import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/core/common/localization/app_strings_common.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

// A Flutter widget that provides user controls for selecting all cart items and proceeding to checkout.
// Displays the total price, selected item count, select-all checkbox, and a checkout button with styling.

class CartTotalBar extends StatelessWidget {
  final double total;

  const CartTotalBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.padding.smd,
        vertical: AppSizes.padding.smd,
      ),
      decoration: AppBoxDecoration.dynamic(context),

      child: Column(
        mainAxisSize: MainAxisSize.min, // important for bottomNavigationBar
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Total Label + Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Label Text
              Text(
                AppStringsCommon.total,
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Price
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSizes.spacing.sm),

          // Checkout Button (Full width)
          Padding(
            padding: EdgeInsets.only(
              bottom: AppSizes.padding.xs + AppOffsets.nudgeSM,
            ),
            child: AppPrimaryButton(
              height: 20.h,
              text: AppStringsCheckout.checkoutTitle,
              onPressed: () => Get.toNamed(AppRoutes.checkoutFlowWrapper),
            ),
          ),
        ],
      ),
    );
  }
}
