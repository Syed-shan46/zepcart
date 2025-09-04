import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A customizable Flutter text field with support for labels, multiple lines, keyboard types, and obscured text for passwords.
// Features rounded, borderless styling with adaptive background colors for consistent theming.
class AppTextfield extends StatelessWidget {
  final String label; // Label for the input field
  final TextEditingController? controller; // Optional controller to control the input
  final TextInputType? keyboardType; // Keyboard type (text, number, email, etc.)
  final bool obscureText; // True if the text should be hidden (for passwords)
  final int? maxLines; // If set, allows multiline input

  const AppTextfield({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,

      decoration: InputDecoration(
        filled: true,
        fillColor: context.colors.surfaceContainerHigh,

        // Text label displayed inside the input field
        labelText: label,
        alignLabelWithHint: true,

        // Styling the label to match theme
        labelStyle: TextStyle(color: context.colors.onSurfaceVariant, fontSize: 12.sp),

        // No visible borders; rounded background
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
        ),
      ),
    );
  }
}
