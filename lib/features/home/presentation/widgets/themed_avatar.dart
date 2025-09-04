import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying a circular avatar with theme-adaptive background color.
// Wraps any child widget inside a styled CircleAvatar with customizable radius.
class ThemedAvatar extends StatelessWidget {
  final Widget child;
  final double radius;

  const ThemedAvatar({super.key, required this.child, this.radius = 22});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colors.surfaceContainerHigh,
      child: child,
    );
  }
}
