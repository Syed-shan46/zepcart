import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_address.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/checkout/domain/models/address_model.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget that displays a saved address with selection, default status, and action buttons for edit and delete.
// Highlights the selected address and visually marks the default address with a badge.
class SavedAddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onSetDefault;

  const SavedAddressCard({
    super.key,
    required this.address,
    required this.isSelected,
    this.onEdit,
    this.onDelete,
    this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main container with address content
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSizes.spacing.xs,
            vertical: AppSizes.spacing.sm,
          ),
          padding: EdgeInsets.all(AppSizes.padding.sm),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withAlpha(10)
                : context.isDarkMode
                ? AppColors.grey.withAlpha(15) // Slight grey in dark mode
                : AppColors.white, // White in light mode
            // Apply a subtle shadow only in light mode
            boxShadow: context.isDarkMode
                ? [] // No shadow in dark mode for flatter appearance
                : isSelected // No shadow when box is selected
                ? []
                : [
                    BoxShadow(
                      color: AppColors.black.withAlpha(13), // Very soft shadow
                      blurRadius: 5,
                      offset: const Offset(0, 2), // Slight downward offset
                    ),
                  ],

            // Rounded corners (configurable via AppSizes)
            borderRadius: BorderRadius.circular(AppSizes.borderRadius.lg),
          ), //
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Address type, default badge, edit/delete buttons
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  SizedBox(width: AppSizes.spacing.betweenItemsSmall),

                  // Address type (e.g., Home, Work)
                  Text(
                    address.type,
                    style: context.text.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Default tag if address.isDefault is true
                  if (address.isDefault)
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.spacing.sm),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.padding.sm,
                        vertical: AppSizes.padding.xs,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadius.xs,
                        ),
                      ),
                      child: Text(
                        AppStringsCheckout.defaultTitle, // e.g., "Default"
                        style: context.text.bodySmall?.copyWith(
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  const Spacer(),

                  // Optional Edit button
                  if (onEdit != null)
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: onEdit,
                      tooltip: AppStringsAddress.edit,
                    ),

                  // Optional Delete button
                  if (onDelete != null)
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20),
                      onPressed: onDelete,
                      tooltip: AppStringsAddress.delete,
                    ),
                ],
              ),
              SizedBox(height: AppSizes.spacing.betweenItemsSmall),

              // Person name
              Text(
                address.name,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Phone number
              Text(address.phone, style: AppTextStyles.bodySmall(context)),
              SizedBox(height: AppSizes.spacing.betweenItemsSmall),

              // Full address string (including hardcoded country)
              Text(
                '${address.address} - ${address.city}, United Arab Emirates',
                style: context.text.bodySmall?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ],
          ),
        ),

        // Top-right circle checkmark if address is selected
        if (isSelected)
          Positioned(
            top: 8,
            right: 4,
            child: Container(
              padding: EdgeInsets.all(AppSizes.padding.xs),
              decoration: BoxDecoration(
                color: context.colors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: AppSizes.font.md,
              ),
            ),
          ),
      ],
    );
  }
}
