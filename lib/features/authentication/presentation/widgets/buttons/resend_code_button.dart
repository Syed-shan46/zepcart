import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings.dart';
import 'package:zepcart/core/common/localization/app_strings_otp.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// A Flutter widget displaying an OTP resend instruction with a countdown timer and clickable links.
// Shows "Check spam folder" link and toggles between countdown display and active "Resend Now" action.
class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({super.key, required this.resendSeconds});

  // Time in seconds before user can resend the OTP
  final int resendSeconds;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: AppTextStyles.bodySmall(context), // Default style
        children: [
          // Static instruction text
          const TextSpan(text: AppStringsOTP.instruction),

          // Clickable "Check spam folder" link
          TextSpan(
            text: '${AppStringsOTP.checkSpam} ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),

          // Static "or" text
          const TextSpan(text: AppStrings.or),

          // Conditional resend timer or active resend link
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text:
                resendSeconds > 0
                    ? '${AppStringsOTP.resendInPrefix} :  ${resendSeconds.toString().padLeft(2, '0')}'
                    : ' ${AppStringsOTP.resendNow}',

            style: context.text.bodySmall?.copyWith(
              // Greyed out while timer is active, colored when clickable
              color: resendSeconds > 0 ? Colors.grey : context.colors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
