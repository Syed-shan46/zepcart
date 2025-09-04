import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A reusable Flutter form text field with customizable styling, validation, and support for password and multi-line input.
// Includes configurable prefix icon, error display, and adaptive theming for consistent UI.
class AppFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final String errorText;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  final bool isDescription;
  final bool needPrefixIcon;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;

  const AppFormTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.errorText = '',
    this.prefixIcon,
    this.onChanged,
    this.obscureText = false,
    this.isDescription = false,
    this.needPrefixIcon = true,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppSizes.borderRadius.lg);

    // define once and reuse the outline input border
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide.none,
    );

    // define once and reuse the error outline input border
    final errorOutlineInputBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    );

    // Define the hint style based on the theme
    final hintStyle = context.text.labelMedium?.copyWith(
      color: context.colors.onSurfaceVariant,
    );

    return TextFormField(
      onSaved: onSaved,
      maxLines: isDescription ? 5 : 1,
      obscureText: obscureText,
      onChanged: onChanged,
      style: context.text.bodyMedium?.copyWith(fontSize: 13.sp),

      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: hintStyle,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon:
            needPrefixIcon
                ? Icon(
                  prefixIcon,
                  color: AppColors.grey600,
                  size: AppSizes.icon.md,
                )
                : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSizes.padding.custom14,
          horizontal: AppSizes.padding.md,
        ),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: errorOutlineInputBorder,
        focusedErrorBorder: errorOutlineInputBorder,
        errorText: errorText.isNotEmpty ? errorText : null,
      ),
    );
  }
}
