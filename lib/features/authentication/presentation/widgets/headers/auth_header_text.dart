import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A reusable widget for displaying headings and subtitles on authentication screens.
// Provides styled, responsive text aligned to the top-left for consistent UI across login, register, and forgot password screens.
class AuthHeaderText extends StatelessWidget {
  final String heading;
  final String subtitle;

  const AuthHeaderText({
    super.key,
    required this.heading,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft, // Align the header to the top left
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading text (e.g., "Welcome Back")
          Text(heading, style: AppTextStyles.heading2(context)),
          SizedBox(height: AppSizes.spacing.betweenItemsSmall),

          // Subtitle text (e.g., "Jhon Doe")
          Text(
            subtitle,
            style: context.text.bodyMedium?.copyWith(
              fontSize: 13.sp, // Font size using ScreenUtil for responsiveness
              color:
                  context.colors.onSurfaceVariant, // Subtle color for subtitle
            ),
          ),
        ],
      ),
    );
  }
}
