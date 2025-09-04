import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';

// Dark theme configuration for the app
final ThemeData darkTheme = ThemeData(
  // Set app brightness to dark mode
  brightness: Brightness.dark,
  // Global primary color for components like buttons and progress bars
  primaryColor: AppColors.primary,
  // Background color for screens
  scaffoldBackgroundColor: AppColors.backgroundDark,
  fontFamily: GoogleFonts.poppins().fontFamily,

  // Define a dark color scheme for consistency across widgets
  colorScheme: ColorScheme.dark(
    // Branding
    primary: AppColors.primaryDark,
    onPrimary: Colors.white,
    secondary: AppColors.accent,
    onSecondary: Colors.black,
    error: AppColors.error,
    onError: Colors.white,

    // Main background
    // Matches: backgroundGrey (dark)
    surfaceContainer: Color(0xFF121212),
    surfaceContainerLow: Color(0xFF1A1A1A),
    surfaceContainerLowest: Color(0xFF1E1E1E),
    surfaceContainerHigh: Colors.grey.shade900,

    // Matches: card
    surface: Colors.grey.shade900,

    // Matches: textprimary
    onSurface: Colors.grey.shade100,

    // Matches: textsecondary
    onSurfaceVariant: Colors.grey.shade400,

    // Borders and Dividers
    outline: Colors.grey.shade800,
    outlineVariant: Colors.grey.shade300,

    // Additional UI helpers
    inversePrimary: AppColors.accent,
    inverseSurface: Colors.white,
    onInverseSurface: Colors.black,
    shadow: Colors.black45,
    scrim: Colors.white10,
    surfaceTint: AppColors.primary,
  ),

  // IconButton styling for dark theme
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColors.white),
      //backgroundColor: WidgetStatePropertyAll(AppColors.transparent),
    ),
  ),

  // AppBar styling for dark theme
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundDark,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Set default text style using Google Fonts (Poppins)
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: AppColors.textWhite,
    displayColor: AppColors.textWhite,
  ),

  // Default icon color in dark mode
  iconTheme: const IconThemeData(color: AppColors.white),

  // Divider appearance
  dividerTheme: const DividerThemeData(
    color: AppColors.greyDark,
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
    iconColor: AppColors.textWhite,
    textColor: AppColors.textWhite,
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
      foregroundColor: WidgetStatePropertyAll(AppColors.white),
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
    labelStyle: const TextStyle(color: AppColors.textWhite),
    hintStyle: const TextStyle(color: AppColors.textSecondary),

    // Background fill
    filled: true,
    fillColor: AppColors.grey800,

    // Focused border style
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius.lg)),
      borderSide: const BorderSide(color: AppColors.primary),
    ),

    // Default border style when enabled
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.borderRadius.lg)),
      borderSide: const BorderSide(color: AppColors.greyDark),
    ),
  ),

  // Bottom Navigation Bar styling
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundDark,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    showUnselectedLabels: true,
  ),
);
