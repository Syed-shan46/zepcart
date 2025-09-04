import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A custom search bar widget with a leading back button,
class SearchBarWithBackButton extends StatelessWidget {
  final TextEditingController? controller;

  // Placeholder text shown in the search field
  final String hintText;

  // Optional callback triggered when back button is pressed
  final VoidCallback? onBack;

  const SearchBarWithBackButton({super.key, this.controller, required this.hintText, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h, // Fixed height for compact search bar
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.sm),

      child: Row(
        children: [
          // Back button that pops the current route or calls onBack
          BackButton(onPressed: onBack),

          // Search input field expands to fill remaining space
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTextStyles.bodyMedium(context),

              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: context.colors.surfaceContainerHigh, // Light background
                // Border when not focused
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                  borderSide: BorderSide(color: context.colors.outline, width: 1),
                ),

                // Border when focused
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Could match inputRadius for consistency
                  borderSide: BorderSide(color: context.colors.primary, width: 1),
                ),

                // Hint style for placeholder text
                hintStyle: context.text.bodySmall?.copyWith(color: context.colors.onSurfaceVariant),

                border: InputBorder.none,
                isDense: true, // Reduces vertical padding for a tighter layout
              ),
            ),
          ),
        ],
      ),
    );
  }
}
