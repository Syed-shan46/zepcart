import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget representing a selectable payment method card with icon, title, and custom subtitle content.
// Visually indicates selection with themed colors and a checkmark indicator, styled with padded container and dynamic decoration.
class CheckoutPaymentCard extends StatelessWidget {
  const CheckoutPaymentCard({
    super.key,
    required this.context,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final BuildContext context; // Parent context for theme-based styling
  final String title; // Title of the card (e.g. "UPI", "Credit Card")
  final Widget subtitle; // Subtitle widget (e.g. account number or masked card)
  final IconData icon; // Leading icon
  final bool selected; // Is this card currently selected
  final VoidCallback onTap; // Callback when the card is tapped

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger selection
      child: Container(
        padding: EdgeInsets.all(AppSizes.padding.smd), // Inner padding
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withAlpha(AppOpacities.almostTransparent)
              : context.isDarkMode
              ? AppColors.grey.withAlpha(
                  AppOpacities.almostTransparent,
                ) // Slight grey in dark mode
              : AppColors.white, // White in light mode
          // Apply a subtle shadow only in light mode
          boxShadow: context.isDarkMode
              ? [] // No shadow in dark mode for flatter appearance
              : selected // No shadow when box is selected
              ? []
              : [
                  BoxShadow(
                    color: AppColors.black.withAlpha(
                      AppOpacities.almostTransparent,
                    ), // Very soft shadow
                    blurRadius: 5,
                    offset: const Offset(0, 2), // Slight downward offset
                  ),
                ],

          // Rounded corners (configurable via AppSizes)
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.lg),
        ), // Card style
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Leading payment method icon
                Icon(
                  icon,
                  color: selected
                      ? this.context.colors.primary
                      : AppColors.grey,
                ),

                SizedBox(width: AppSizes.spacing.sm),

                // Title of the payment method
                Text(
                  title,
                  style: TextStyle(
                    color: selected
                        ? this.context.colors.primary
                        : context.colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Spacer(), // Pushes the check icon to the end
                // Show check icon if selected
                if (selected)
                  Container(
                    padding: EdgeInsets.all(AppSizes.padding.xs),
                    decoration: BoxDecoration(
                      color: this.context.colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: AppSizes.font.md,
                    ),
                  ),
              ],
            ),

            SizedBox(height: AppSizes.spacing.sm),

            // Subtitle content (custom widget)
            subtitle,
          ],
        ),
      ),
    );
  }
}
