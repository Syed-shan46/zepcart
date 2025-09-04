import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';

// A Flutter widget displaying a notice with clickable "Terms of Service" and "Privacy Policy" links.
// Uses RichText and TapGestureRecognizer to enable interactive inline text styling.
class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),

      // RichText allows different text styles and actions within one block
      child: RichText(
        textAlign: TextAlign.center, // Center-align all content
        text: TextSpan(
          children: [
            // Informational sentence part (e.g., "By continuing, you agree to the")
            TextSpan(
              text: '${AppStringsAuth.termsAndConditionsNotice} ',
              style: context.text.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),

            // Clickable "Terms of Service" link
            TextSpan(
              text: AppStringsAuth.termsOfService,
              style: context.text.bodySmall?.copyWith(
                color: context.colors.primary, // Highlighted color for links
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),

            // "and" connector with slightly transparent color
            TextSpan(
              text: ' ${AppStrings.and} ',
              style: context.text.bodySmall?.copyWith(
                color: context.colors.onSurface.withAlpha(
                  AppOpacities.mediumOpaque,
                ),
              ),
            ),

            // Clickable "Privacy Policy" link
            TextSpan(
              text: AppStringsAuth.privacyPolicy,
              style: context.text.bodySmall?.copyWith(
                color: context.colors.primary,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
