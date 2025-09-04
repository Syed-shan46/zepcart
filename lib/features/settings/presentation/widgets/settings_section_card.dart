import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

// A Flutter widget providing a styled container to group related settings tiles vertically.
// Applies adaptive decoration and spacing for consistent section card appearance.
class SettingsSectionCard extends StatelessWidget {
  final List<Widget> children; // List of widgets (usually SettingsTile) to display inside the card

  const SettingsSectionCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Adds bottom spacing between this card and others
      margin: EdgeInsets.only(bottom: AppSizes.spacing.lg),

      // Vertical padding inside the card
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding.sm),

      // Applies a decorated background that adapts to light/dark mode
      decoration: AppBoxDecoration.dynamic(context),

      // Arranges all child widgets in a vertical column
      child: Column(children: children),
    );
  }
}
