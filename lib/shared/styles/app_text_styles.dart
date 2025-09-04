import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A utility class providing consistent, responsive text styles using Flutter's TextTheme and ScreenUtil.
// Defines styles for headings, body text, inputs, buttons, captions, and error messages.
class AppTextStyles {
  // Heading styles
  static TextStyle heading1(BuildContext context) =>
      context.text.headlineLarge!.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold);

  static TextStyle heading2(BuildContext context) =>
      context.text.headlineMedium!.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600);

  static TextStyle heading3(BuildContext context) =>
      context.text.headlineSmall!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600);

  // Body styles
  static TextStyle bodyLarge(BuildContext context) =>
      context.text.bodyLarge!.copyWith(fontSize: 16.sp);

  static TextStyle bodyMedium(BuildContext context) =>
      context.text.bodyMedium!.copyWith(fontSize: 14.sp);

  static TextStyle bodySmall(BuildContext context) =>
      context.text.bodySmall!.copyWith(fontSize: 12.sp);

  // Input text
  static TextStyle inputText(BuildContext context) =>
      context.text.bodyMedium!.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500);

  // Button
  static TextStyle buttonText(BuildContext context) => context.text.labelLarge!.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // Caption
  static TextStyle caption(BuildContext context) =>
      context.text.bodySmall!.copyWith(fontSize: 11.sp, color: Theme.of(context).hintColor);

  // Error
  static TextStyle errorText(BuildContext context) =>
      context.text.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error, fontSize: 12.sp);
}
