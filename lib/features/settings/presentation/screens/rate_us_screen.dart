import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/input_fields/app_textfield.dart';
import 'package:zepcart/features/settings/presentation/widgets/rate_us_action_buttons.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({super.key});

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const RateUsActionButtons(),

      // AppBar with title
      appBar: PrimaryAppbar(),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.spacing.md),

            // Rate Us Title
            Text(
              AppStringsSettings.rateUsTitle,
              style: context.text.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.spacing.betweenItems),

            // Subtitle
            Text(
              AppStringsSettings.rateUsSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium(context),
            ),
            SizedBox(height: AppSizes.spacing.lg),

            // Rating header
            Text(
              AppStringsSettings.rateYourExperience,
              style: context.text.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSizes.spacing.sm),

            // Stars
            _buildRatingStars(),
            SizedBox(height: AppSizes.spacing.md),

            // Feedback prompt
            if (_selectedRating > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getRatingFeedbackPrompt(),
                    style: context.text.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacing.sm),
                ],
              ),

            // Feedback Input
            AppTextfield(
              label: AppStringsSettings.ratePlaceholder,
              maxLines: 5,
            ),
            SizedBox(height: AppSizes.spacing.md),

            // Contact Support
            GestureDetector(
              onTap: () {
                // Handle contact support tap
              },
              child: Text(
                AppStringsSettings.contactSupport,
                style: context.text.bodyMedium?.copyWith(
                  decoration: TextDecoration.underline,
                  color: context.colors.primary,
                  decorationColor: context.colors.primary,
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  Row _buildRatingStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            _selectedRating > index ? Icons.star : Icons.star_border,
            color: AppColors.warning,
            size: AppSizes.icon.lg,
          ),
          onPressed: () {
            setState(() {
              _selectedRating = index + 1;
            });
          },
        );
      }),
    );
  }

  String _getRatingFeedbackPrompt() {
    if (_selectedRating <= 2) {
      return AppStringsSettings.rateFeedbackPromptPoor;
    } else if (_selectedRating <= 4) {
      return AppStringsSettings.rateFeedbackPromptAverage;
    } else {
      return AppStringsSettings.rateFeedbackPromptExcellent;
    }
  }
}
