import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget providing a reusable outlined button with icon and label for search actions.
// Supports theming and consistent styling for buttons across the search interface.
class SearchActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const SearchActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,

      child: OutlinedButton.icon(
        onPressed: onPressed,

        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
          side: BorderSide(color: context.colors.outline),
        ),

        icon: Icon(
          icon,
          color: context.colors.onSurface,
          size: AppSizes.font.md,
        ),
        label: Text(label, style: AppTextStyles.bodyMedium(context)),
      ),
    );
  }
}
