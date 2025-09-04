import 'package:flutter/material.dart';

// A utility class providing device-specific UI dimensions such as screen size, status bar, app bar, and bottom navigation bar heights.
// Simplifies retrieval of these metrics using MediaQuery and Flutter constants for responsive layouts.
class AppDeviceUtils {
  // Get screen height using MediaQuery
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Get screen width using MediaQuery
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get status bar height using padding.top
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // Get navigationbar height
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // Get the height of the app bar
  static double getAppBarHeight() {
    return kToolbarHeight;
  }
}
