import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/providers/theme_provider.dart';

// A Flutter widget representing a theme mode selection card used in appearance settings.
// Highlights the selected mode and updates the app theme via Riverpod state management.
class ThemeModeOption extends ConsumerWidget {
  final IconData icon;
  final String label;
  final AppThemeMode mode;

  const ThemeModeOption({super.key, required this.icon, required this.label, required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(themeModeProvider);
    final isSelected = selectedMode == mode;

    return InkWell(
      onTap: () => ref.read(themeModeProvider.notifier).state = mode,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(AppSizes.padding.md),
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          border: Border.all(
            color: isSelected ? context.colors.primary : AppColors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: AppSizes.font.sm * 2),
            SizedBox(height: AppSizes.spacing.betweenItems),
            Text(label, style: context.text.bodyMedium, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
