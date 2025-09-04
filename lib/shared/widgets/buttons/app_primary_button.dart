import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A customizable Flutter primary action button supporting text, colors, border radius, and sizing options.
class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double height;
  final double letterSpacing;
  final FontWeight? fontWeight;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.fontWeight = FontWeight.w600,
    this.height = 50,
    this.letterSpacing = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? AppSizes.buttonRadius);

    return Container(
      // Outer decoration layer gives a colored background (with ripple above it)
      decoration: BoxDecoration(
        borderRadius: radius,
        color: backgroundColor ?? context.colors.primary, // Override primary color support
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Let container show the background
          shadowColor: Colors.transparent, // No elevation shadow
          minimumSize: Size(double.infinity, height),
          padding: EdgeInsets.zero, // Ensures alignment with container
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
        child: Text(
          text,
          style: context.text.titleMedium?.copyWith(
            fontSize: fontSize ?? 15.sp,
            color: textColor ?? AppColors.white,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}
