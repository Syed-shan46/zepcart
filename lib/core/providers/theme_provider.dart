import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provides Riverpod state management for app theme modes (light, dark, system).
// Integrates easily with Flutter’s ThemeMode for user theme preference control.
enum AppThemeMode { light, dark, system }

final themeModeProvider = StateProvider<AppThemeMode>((ref) {
  return AppThemeMode.system;
});

final effectiveThemeModeProvider = Provider<ThemeMode>((ref) {
  final selected = ref.watch(themeModeProvider);
  switch (selected) {
    case AppThemeMode.light:
      return ThemeMode.light;
    case AppThemeMode.dark:
      return ThemeMode.dark;
    case AppThemeMode.system:
      return ThemeMode.system;
  }
});
