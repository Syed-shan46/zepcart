import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_cart.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

// A Flutter widget presenting verification information with a list of reasons and a verification button.
// Designed as a bottom sheet with a draggable handle, responsive layout, and styled text and buttons.
class VerifyAccountSheet extends StatelessWidget {
  const VerifyAccountSheet({
    super.key,
    required this.verificationReasons,
    required this.onVerify,
  });

  final List<String> verificationReasons;
  final VoidCallback onVerify;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.padding.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 50,
              height: 5,
              margin: EdgeInsets.only(bottom: AppSizes.spacing.md),
              decoration: BoxDecoration(
                color: context.colors.onSurface,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
              ),
            ),

            // Title
            Text(
              AppStringsCart.verifyPhoneNumber,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spacing.md),

            // ✅ Reason list
            ...verificationReasons.asMap().entries.map((entry) {
              int index = entry.key;
              String reason = entry.value;
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: context.colors.primary,
                        size: 18,
                      ),
                      SizedBox(width: AppSizes.spacing.sm),
                      Expanded(
                        child: Text(
                          reason,
                          style: AppTextStyles.bodyMedium(context),
                        ),
                      ),
                    ],
                  ),
                  if (index < verificationReasons.length - 1)
                    SizedBox(height: AppSizes.spacing.md),
                ],
              );
            }),

            SizedBox(height: AppSizes.spacing.md),

            // ✅ Verify Button
            SizedBox(
              height: 35.h,
              width: double.infinity,
              child: AppPrimaryButton(
                text: AppStringsCart.verifyAccount,
                letterSpacing: 1,
                onPressed: onVerify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
