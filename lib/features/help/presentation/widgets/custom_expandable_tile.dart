import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying an expandable/collapsible tile with a question title and answer content.
// Allows toggling to show or hide detailed content with smooth animation.
class CustomExpandableTile extends StatefulWidget {
  final String title; // Question title
  final String content; // Answer content

  const CustomExpandableTile({super.key, required this.title, required this.content});

  @override
  State<CustomExpandableTile> createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> {
  bool expanded = false; // Tracks the current expanded/collapsed state

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question title with toggle arrow
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => setState(() => expanded = !expanded), // Toggle expanded state
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.padding.smd),
            child: Row(
              children: [
                // Question text
                Expanded(
                  child: Text(
                    widget.title,
                    style: context.text.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                // Arrow icon to indicate expand/collapse
                Icon(
                  expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Theme.of(context).iconTheme.color,
                ),
              ],
            ),
          ),
        ),

        // Expandable answer section
        AnimatedCrossFade(
          crossFadeState: expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 250),
          sizeCurve: Curves.easeInOut,
          firstChild: Padding(
            padding: EdgeInsets.only(bottom: AppSizes.padding.md),
            child: Text(
              widget.content,
              style: context.text.bodyMedium?.copyWith(
                fontSize: 13.sp,
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ),
          secondChild: const SizedBox.shrink(), // Hidden state
        ),

        // Spacing between tiles
        SizedBox(height: AppSizes.spacing.betweenItems),
      ],
    );
  }
}
