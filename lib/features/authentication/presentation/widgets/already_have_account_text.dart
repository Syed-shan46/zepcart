import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/routes/app_routes.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: AppStringsAuth.alreadyHaveAccount,
          style: context.text.bodySmall?.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
          children: [
            TextSpan(
              text: ' ${AppStringsAuth.login}',
              style: TextStyle(color: context.colors.primary),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}
