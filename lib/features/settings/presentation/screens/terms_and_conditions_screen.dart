import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsSettings.termsTitle),

      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),

        // Scrollable content for long text
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introductory description
              Text(
                AppStringsSettings.termsIntro,
                style: context.text.bodyMedium,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Section 1: General Terms
              Text(
                AppStringsSettings.section1Title,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.spacing.sm),

              Text(
                AppStringsSettings.section1Content,
                style: context.text.bodyMedium,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Section 2: Privacy & Security
              Text(
                AppStringsSettings.section2Title,
                style: context.text.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.spacing.sm),

              Text(
                AppStringsSettings.section2Content,
                style: context.text.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
