import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/routes/app_routes.dart';

// Displays a confirmation dialog prompting the user to confirm or cancel logout.
// Executes a callback on confirmation and navigates to the login screen.
Future<void> showLogoutConfirmationDialog(BuildContext context, VoidCallback onConfirm) {
  return showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        // Padding around the title, content, and buttons
        titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        actionsPadding: const EdgeInsets.only(bottom: 16, right: 16),

        // Dialog title
        title: Text(
          AppStringsSettings.logout,
          style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),

        // Dialog content message
        content: Text(
          AppStringsSettings.logoutConfirmationMessage,
          style: context.text.bodyMedium?.copyWith(height: 1.4),
        ),

        // Cancel and Logout buttons
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              AppStringsSettings.cancel,
              style: context.text.labelLarge?.copyWith(color: AppColors.grey600),
            ),
          ),
          // Logout button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.pop(dialogContext); // Close dialog first
              onConfirm(); // Execute passed logout logic (like clearing tokens)
              Get.offAllNamed(AppRoutes.login); // Navigate to login screen
            },
            child: Text(AppStringsSettings.logout),
          ),
        ],
      );
    },
  );
}
