import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A circular avatar with theme-adaptive background color.
// Wraps any child widget inside a styled CircleAvatar with customizable radius.
class ThemedText extends StatelessWidget {
  final String text;
  final double fontSize;

  const ThemedText(this.text, {super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.text.bodySmall, overflow: TextOverflow.ellipsis);
  }
}
