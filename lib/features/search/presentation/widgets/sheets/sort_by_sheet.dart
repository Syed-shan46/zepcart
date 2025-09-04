import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/overlays/app_bottom_sheet_handle.dart';

class SortBySheet extends StatelessWidget {
  const SortBySheet({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          SizedBox(height: AppSizes.spacing.sm),
          AppBottomSheetHandle(),
          // Sorting options
          ...options.map((option) {
            return RadioListTile<String>(
              fillColor: WidgetStateProperty.all(context.colors.surface),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                  Navigator.pop(context);
                }
              },
              title: Text(option, style: AppTextStyles.bodyMedium(context)),
              contentPadding: EdgeInsets.zero,
            );
          }),
        ],
      ),
    );
  }
}
