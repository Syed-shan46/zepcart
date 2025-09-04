import 'package:flutter/cupertino.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

// A reusable Flutter widget representing a small horizontal handle bar for draggable bottom sheets.
// Typically placed at the top of bottom sheets to indicate drag functionality.
class AppBottomSheetHandle extends StatelessWidget {
  const AppBottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50, // Width of the handle bar
        height: 5, // Thickness of the handle bar
        margin: EdgeInsets.only(bottom: AppSizes.spacing.md), // Spacing below the handle
        decoration: AppBoxDecoration.dynamic(context), // Reusable decoration (rounded and colored)
      ),
    );
  }
}
