import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';

// A reusable Flutter container widget with customizable rounded corners, padding, margin, border, background color, and shadow.
// Designed for flexible use as a stylized wrapper around child widgets throughout the app.
class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 16,
    this.child,
    this.backgroundColor = AppColors.white,
    this.padding,
    this.margin,
    this.borderColor = AppColors.primary,
    this.showBorder = false,
    this.boxShadow,
  });

  final double? width;
  final double? height;
  final double radius;

  // Child widget to display inside the container
  final Widget? child;

  // Inner padding
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Color borderColor;
  final bool showBorder;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
