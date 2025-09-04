import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/routes/app_routes.dart';

// A Flutter widget displaying a prompt with a clickable "Register" text that navigates to the registration screen.
// Uses RichText and TapGestureRecognizer for inline styled and interactive text.
class RegisterPromptWidget extends StatelessWidget {
  const RegisterPromptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Static part of the prompt text
        text: AppStringsAuth.dontHaveAccount,
        style: context.text.bodySmall?.copyWith(
          color: context.colors.onSurfaceVariant,
        ),
        children: <TextSpan>[
          // Clickable "Register" text
          TextSpan(
            text: ' ${AppStringsAuth.register}',
            style: context.text.bodySmall?.copyWith(
              color: context.colors.primary, // Highlight color
              fontWeight: FontWeight.w600,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () => Get.toNamed(AppRoutes.register),
          ),
        ],
      ),
    );
  }
}
