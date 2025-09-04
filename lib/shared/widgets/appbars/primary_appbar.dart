import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';

// A customizable Flutter AppBar widget supporting text or widget titles, optional leading and action widgets.
// Provides default back button behavior and configurable styling for versatile primary app bars.
class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // Optional text title
  final Widget? titleWidget; // Optional widget title (overrides `title`)
  final bool centerTitle; // Whether to center the title
  final Widget? leading; // Custom leading widget (like back button)
  final List<Widget>? actions; // Action buttons on the right
  final Color? backgroundColor; // Background color of the AppBar
  final double elevation; // Shadow elevation

  const PrimaryAppbar({
    super.key,
    this.title,
    this.titleWidget,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation = 0.0,
  });

  // Standard height for AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      // Displays title widget if provided, else uses text title
      title:
          titleWidget ??
          (title != null
              ? Text(
                title!,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.font.md,
                ),
              )
              : null),

      centerTitle: centerTitle,
      // Uses given backgroundColor or default scaffold background
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      elevation: elevation,
      // Default back button if no custom leading provided
      leading: leading ?? _defaultLeading(context),
      actions: actions,
      iconTheme: theme.iconTheme,
      // Prevent color overlay from surfaceTint in Material 3
      surfaceTintColor: Colors.transparent,
    );
  }

  /// Returns default back arrow button if the route can pop
  Widget? _defaultLeading(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return canPop
        ? IconButton(
          icon: Icon(Icons.arrow_back, size: 22.sp),
          onPressed: () => Navigator.of(context).pop(),
        )
        : null;
  }
}
