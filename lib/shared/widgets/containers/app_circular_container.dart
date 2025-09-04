import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A customizable, responsive container widget with circular or rounded rectangular shape.
// Supports optional child widget, border, padding, margin, and adaptive color based on theme.
class AppCircularContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final Widget? child;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  // If provided, overrides default circle shape with a custom border radius.
  final BorderRadius? borderRadius;

  const AppCircularContainer({
    super.key,
    required this.height,
    required this.width,
    this.color,
    this.child,
    this.border,
    this.padding,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // If no borderRadius is given, treat this as a perfect circle.
    final isCircle = borderRadius == null;

    return Container(
      height: height.h, // Responsive height using screenutil
      width: width.w, // Responsive width using screenutil
      padding: padding,
      margin: margin,
      alignment: Alignment.center, // Center the child widget

      decoration: BoxDecoration(
        color: color ?? context.colors.primary, // Use given color or fallback to theme primary
        // Use circular shape if no borderRadius provided, otherwise use rectangle
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,

        border: border,

        // Apply borderRadius only if it's not a circle
        borderRadius: isCircle ? null : borderRadius,
      ),

      child: child, // Optional child inside the container
    );
  }
}
