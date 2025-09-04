import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/core/providers/theme_provider.dart';
import 'package:zepcart/features/settings/presentation/widgets/theme_mode_option.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

// A screen that allows the user to choose between Light, Dark, or System theme modes.
class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // Custom AppBar
      appBar: PrimaryAppbar(title: AppStringsSettings.appearanceTitle),

      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              AppStringsSettings.chooseTheme,
              style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: AppSizes.spacing.xs),

            // Description subtitle
            Text(
              AppStringsSettings.description,
              style: context.text.bodyMedium?.copyWith(color: AppColors.grey),
            ),

            SizedBox(height: AppSizes.spacing.betweenSections),

            // Theme selection options laid out in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ThemeModeOption(
                  icon: Icons.wb_sunny_outlined,
                  label: AppStringsSettings.light,
                  mode: AppThemeMode.light,
                ),
                ThemeModeOption(
                  icon: Icons.nightlight_round,
                  label: AppStringsSettings.dark,
                  mode: AppThemeMode.dark,
                ),
                ThemeModeOption(
                  icon: Icons.brightness_auto,
                  label: AppStringsSettings.system,
                  mode: AppThemeMode.system,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
