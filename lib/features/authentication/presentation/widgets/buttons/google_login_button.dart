import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A reusable Flutter outlined button with a FontAwesome Google icon for initiating Google login.
// Styled for full-width display with consistent padding, border radius, and adaptive theming.
class GoogleLoginButtonWidget extends StatelessWidget {
  const GoogleLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button take full width
      child: OutlinedButton.icon(
        icon: FaIcon(FontAwesomeIcons.google, size: AppSizes.icon.md),

        // Button label with consistent text styling
        label: Text(
          AppStringsAuth.loginWithGoogle,
          style: AppTextStyles.bodyMedium(context),
        ),

        // Styling for the outlined button
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: context.colors.outline),
          backgroundColor: context.colors.surface,
          padding: EdgeInsets.symmetric(vertical: AppSizes.padding.sm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
          ),
        ),

        onPressed: () async {
          // Handle Google login press
        },
      ),
    );
  }
}
