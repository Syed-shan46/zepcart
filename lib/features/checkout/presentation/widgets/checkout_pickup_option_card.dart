import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

// A Flutter widget providing a self-pickup option card with store details and a toggle switch.
// Shows pickup info, location, and savings, allowing users to enable or disable self-pickup.
class CheckoutPickupOptionCard extends StatelessWidget {
  final bool selfPickup; // Whether self-pickup is selected
  final ValueChanged<bool> onToggle; // Callback when toggled

  const CheckoutPickupOptionCard({
    super.key,
    required this.selfPickup,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with info tooltip
        Row(
          children: [
            Text(
              AppStringsCheckout.selfPickupSwitchLabel,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: AppSizes.spacing.xs),
            Tooltip(
              message: AppStringsCheckout.selfPickupNote,
              child: Icon(Icons.info_outline, size: AppSizes.font.md),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spacing.xs),

        // Subtitle below title
        Text(
          AppStringsCheckout.selfPickupNote,
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: AppSizes.spacing.md),

        // Store card with toggle
        Container(
          padding: EdgeInsets.all(AppSizes.padding.smd),
          decoration: AppBoxDecoration.dynamic(context),
          child: Row(
            children: [
              // Store icon avatar
              CircleAvatar(
                backgroundColor: context.colors.surface,
                child: Icon(Icons.store, color: context.colors.primary),
              ),

              SizedBox(width: AppSizes.spacing.md),

              // Store details column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store name
                    Text(
                      AppStringsCheckout.pickupStore,
                      style: context.text.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Discount/savings info
                    Text(
                      AppStringsCheckout.pickupSaveText,
                      style: context.text.bodySmall?.copyWith(
                        color: AppColors.success,
                      ),
                    ),

                    SizedBox(height: AppSizes.spacing.xs),

                    // Store location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: AppSizes.font.sm,
                          color: context.colors.onSurfaceVariant,
                        ),
                        SizedBox(width: AppSizes.spacing.xs),
                        Expanded(
                          child: Text(
                            AppStringsCheckout.pickupLocation,
                            style: context.text.bodySmall?.copyWith(
                              fontSize: 11.sp,
                              color: context.colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Toggle switch
              Switch(
                value: selfPickup,
                onChanged: onToggle,
                activeColor: context.colors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
