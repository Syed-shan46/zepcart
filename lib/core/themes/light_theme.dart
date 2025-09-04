import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';

// Light theme configuration for the app
final ThemeData lightTheme = ThemeData(
  // Set app brightness to light mode
  brightness: Brightness.light,
  // Global primary color for components like buttons and progress bars
  primaryColor: AppColors.primary,
  fontFamily: GoogleFonts.poppins().fontFamily,
  // Background color for screens
  scaffoldBackgroundColor: AppColors.backgroundLight,

  // Define a light color scheme for consistency across widgets
  colorScheme: ColorScheme.light(
    // Branding
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.accent,
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,

    // Matches: background
    surfaceContainer: Colors.grey.shade200,
    surfaceContainerLow: Colors.grey.shade100,
    surfaceContainerLowest: Colors.grey.shade50,
    surfaceContainerHigh: Colors.grey.shade200,

    // Matches: card
    surface: Colors.grey.shade200,

    // Matches: textprimary
    onSurface: Colors.grey.shade800,

    // Matches: textsecondary
    onSurfaceVariant: Colors.grey.shade600,

    // Borders and Dividers
    outline: Colors.grey.shade300,
    outlineVariant: Colors.grey.shade700,

    // Additional UI helpers
    inversePrimary: AppColors.accent,
    inverseSurface: Colors.black,
    onInverseSurface: Colors.white,
    shadow: Colors.black12,
    scrim: Colors.black26,
    surfaceTint: AppColors.primary,
  ),

  // IconButton styling for light theme
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColors.textDark),
      //backgroundColor: WidgetStatePropertyAll(AppColors.transparent),
      //overlayColor: WidgetStatePropertyAll(AppColors.greyLight.withOpacity(0.2)),
    ),
  ),

  // AppBar styling for light theme
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundLight,
    iconTheme: IconThemeData(color: AppColors.textDark),
    titleTextStyle: TextStyle(
      color: AppColors.textDark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Set default text style using Google Fonts (Poppins)
  // Use Google Fonts + default text theme
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: AppColors.textDark,
    displayColor: AppColors.textDark,
  ),

  // Default icon color in light mode
  iconTheme: const IconThemeData(color: AppColors.textDark),

  // Divider appearance
  dividerTheme: const DividerThemeData(
    color: AppColors.greyLight,
    thickness: 1,
    space: 32,
  ),

  // Card widget styling
  cardTheme: CardThemeData(
    color: AppColors.greyLight.withAlpha(13),
    margin: const EdgeInsets.all(8),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
    ),
  ),

  // ListTile default styling
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.textDark,
    textColor: AppColors.textDark,
    tileColor: Colors.transparent,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),

  // ElevatedButton styling
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primary),
      foregroundColor: WidgetStatePropertyAll(AppColors.white),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  ),

  // OutlinedButton styling
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.black),
      side: WidgetStatePropertyAll(
        BorderSide(color: AppColors.primary, width: 1.5),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  ),

  // TextButton styling
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppColors.primary),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  ),

  // Button theme (legacy)
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  ),

  // Input fields styling (TextFormField, TextField)
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color: AppColors.textDark),
    hintStyle: const TextStyle(color: AppColors.textSecondary),
    filled: true,
    fillColor: AppColors.grey200,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius.lg)),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius.lg)),
      borderSide: const BorderSide(color: AppColors.greyLight),
    ),
  ),

  // Bottom Navigation Bar styling
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundLight,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    showUnselectedLabels: true,
  ),
);
