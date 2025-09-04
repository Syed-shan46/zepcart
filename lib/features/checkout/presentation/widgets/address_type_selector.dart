import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';

class AddressTypeSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  AddressTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<AddressType> addressTypes = [
    AddressType("Home", Icons.home_rounded),
    AddressType("Office", Icons.work_rounded),
    AddressType("Other", Icons.location_on_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(addressTypes.length, (index) {
        final isSelected = selectedIndex == index;
        final type = addressTypes[index];

        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: AppSizes.spacing.xs),
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.padding.sm,
                horizontal: AppSizes.padding.sm,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.grey200,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius.sm),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    type.icon,
                    color: isSelected ? AppColors.white : AppColors.grey,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    type.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.white : AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class AddressType {
  final String label;
  final IconData icon;
  AddressType(this.label, this.icon);
}
