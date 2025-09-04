import 'package:flutter/material.dart';

// An extension on BuildContext providing convenient shortcuts to access theme properties like brightness, TextTheme, and ColorScheme.
// Simplifies code by enabling concise syntax for common theme-related calls.
extension ThemeContextExtension on BuildContext {
  // Checks if the current theme mode is dark.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // Returns the current ThemeData.
  ThemeData get theme => Theme.of(this);

  // Returns the TextTheme from ThemeData.
  // ✅ Renamed for brevity: use `context.text` instead of `context.theme.textTheme`.
  TextTheme get text => theme.textTheme;

  // Returns the ColorScheme from ThemeData.
  // ✅ Renamed for clarity: use `context.colors` instead of `context.theme.colorScheme`.
  ColorScheme get colors => theme.colorScheme;
}
