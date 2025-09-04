import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying a horizontally scrollable row of choice chips for single selection.
// Supports dark mode styling and customizable spacing between chips.
class AppChoiceChips extends StatelessWidget {
  final List<String> items; // List of options to display
  final String selectedItem; // Currently selected item
  final ValueChanged<String> onSelected; // Callback when a chip is selected
  final bool isDarkMode; // Whether the app is in dark mode
  final double spacing; // Space between chips

  const AppChoiceChips({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
    required this.isDarkMode,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Allows horizontal scrolling if chips overflow
      child: Row(
        children:
            items.map((item) {
              final isSelected = selectedItem == item;

              return Padding(
                padding: EdgeInsets.only(right: spacing), // Spacing between each chip
                child: ChoiceChip(
                  showCheckmark: false, // No checkmark inside the chip
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces chip height
                  // Chip label with conditional text color
                  label: Text(
                    item,
                    style: context.text.bodySmall?.copyWith(
                      color:
                          isSelected
                              ? context
                                  .colors
                                  .onPrimary // Text color when selected
                              : context.colors.onSurfaceVariant, // Text color when not selected
                    ),
                  ),

                  selected: isSelected, // Determines chip appearance
                  onSelected: (_) => onSelected(item), // Trigger selection callback
                  // Background color for selected chip
                  selectedColor: context.colors.primary.withAlpha(AppOpacities.fullyOpaque),

                  // Chip shape and border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 0.4,
                      color: isSelected ? context.colors.primary : context.colors.outlineVariant,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
