import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A reusable Flutter widget representing a settings list tile with an icon, title, and optional destructive styling.
// Supports tap callbacks and shows a trailing arrow to indicate navigable actions.
class SettingsTile extends StatelessWidget {
  final IconData icon; // Leading icon
  final String title; // Title text of the tile
  final bool
  isDestructive; // Whether the tile is a destructive action (e.g., Logout/Delete)
  final VoidCallback? onTap; // Callback for tile tap

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.isDestructive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity:
          VisualDensity.compact, // Reduces height of tile for a tighter layout
      // Leading icon with optional red color if destructive
      leading: Icon(icon, color: isDestructive ? AppColors.error : null),

      // Title with conditional error color if destructive
      title: Text(
        title,
        style: context.text.titleSmall?.copyWith(
          color: isDestructive ? AppColors.error : null,
        ),
      ),

      // Right side arrow icon (typically used for navigable tiles)
      trailing: Icon(Icons.arrow_forward_ios, size: AppSizes.font.md),
      onTap: onTap,
    );
  }
}
