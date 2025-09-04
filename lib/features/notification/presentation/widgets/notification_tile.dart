import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_notification.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

// Expandable notification tile with icon, title, and subtitle.
// Supports faded appearance for read notifications.
class NotificationTile extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool faded;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.faded = false,
  });

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      // Apply faded effect for read/old notifications
      opacity: widget.faded ? 0.5 : 1.0,

      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,

        child: Container(
          margin: EdgeInsets.only(bottom: AppSizes.spacing.md),
          padding: EdgeInsets.all(AppSizes.spacing.sm),
          decoration: BoxDecoration(
            color: context.colors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Leading Icon
              Icon(widget.icon, color: widget.iconColor),
              SizedBox(width: AppSizes.spacing.sm),

              // Main Content (title + subtitle + toggle)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title text
                    Text(
                      widget.title,
                      style: context.text.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: AppSizes.spacing.xs),

                    // Subtitle + Toggle with LayoutBuilder
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final textPainter = TextPainter(
                          text: TextSpan(
                            text: widget.subtitle,
                            style: AppTextStyles.bodySmall(context),
                          ),
                          maxLines: 1,
                          textDirection: TextDirection.ltr,
                        )..layout(maxWidth: constraints.maxWidth);

                        final hasOverflow = textPainter.didExceedMaxLines;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Subtitle text (expandable)
                            Text(
                              widget.subtitle,
                              style: AppTextStyles.bodySmall(context),
                              maxLines: _isExpanded ? null : 1,
                              overflow: _isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                            ),

                            if (hasOverflow) ...[
                              SizedBox(height: AppSizes.spacing.xs),
                              GestureDetector(
                                onTap: () => setState(() {
                                  _isExpanded = !_isExpanded;
                                }),
                                child: Text(
                                  _isExpanded
                                      ? AppStringsNotifications.viewLess
                                      : AppStringsNotifications.viewMore,
                                  style: context.text.bodySmall?.copyWith(
                                    fontSize: 12.sp,
                                    color: context.colors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
