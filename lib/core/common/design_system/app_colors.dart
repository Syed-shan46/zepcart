import 'package:flutter/material.dart';

// A centralized class defining the app's color palette including primary, grayscale, background, and semantic colors.
// Provides helper methods for dynamic color selection based on the current theme brightness.
class AppColors {
  static const Color favorite = Color(0xFFE53935); // or any red you prefer

  // Primary Theme Colors
  static const Color primary = Color(0xFF0A84FF);
  static const Color primaryDark = Color(0xFF3A56CC);
  static const Color accent = Color(0xFFFFC107);

  // Grayscale
  static const Color black = Color(0xFF000000);
  static const Color dark = Color(0xFF121212);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color greyDark = Color(0xFF616161);
  static const Color white = Color(0xFFFFFFFF);

  // App Greys
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey850 = Color(0xFF2E2E2E);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF1A1A1D);

  // Success / Error / Warning / info
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF000000);

  // Transparent
  static const Color transparent = Colors.transparent;

  // Static same brightness utility
  static Color sameBrightness(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;
  }
}
