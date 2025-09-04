import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A reusable and customizable divider widget with optional parameters for color, thickness, indents, and height.
// Defaults to theme's outline color and standard app spacing for consistent visual separation across the app.
class AppDivider extends StatelessWidget {
  // Optional custom color for the divider. Defaults to `context.colors.outline`.
  final Color? color;

  // The thickness of the divider line. Default is `1.0`.
  final double thickness;

  // Empty space to the leading edge of the divider.
  final double indent;

  // Empty space to the trailing edge of the divider.
  final double endIndent;

  // The total height of the space the divider occupies vertically.
  final double? height;

  const AppDivider({
    super.key,
    this.color,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      // Use the provided color or fallback to outline color from theme
      color: color ?? context.colors.outline,

      // Thickness of the divider line
      thickness: thickness,

      // Space before the start of the divider
      indent: indent,

      // Space after the end of the divider
      endIndent: endIndent,

      // Vertical space the divider takes (including empty space)
      height: height ?? AppSizes.spacing.md,
    );
  }
}
