import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsSettings.privacyPolicyTitle),

      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction paragraph
              Text(
                AppStringsSettings.privacyIntro,
                style: AppTextStyles.bodyMedium(context),
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Section 1 Title
              Text(
                AppStringsSettings.privacySection1Title,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.spacing.sm),

              // Section 1 Content
              Text(
                AppStringsSettings.privacySection1Content,
                style: AppTextStyles.bodyMedium(context),
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Section 2 Title
              Text(
                AppStringsSettings.privacySection2Title,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.spacing.sm),

              // Section 2 Content
              Text(
                AppStringsSettings.privacySection2Content,
                style: AppTextStyles.bodyMedium(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
