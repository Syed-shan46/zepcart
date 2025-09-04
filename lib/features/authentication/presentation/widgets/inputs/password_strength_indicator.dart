import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/helpers/password_strength_checker.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';

// A Flutter widget that visually represents password strength with color-coded bars.
// Uses PasswordStrength enum to determine the active bar count and colors.
class PasswordStrengthIndicator extends StatelessWidget {
  final PasswordStrength strength;

  const PasswordStrengthIndicator({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    int activeBars = 1;

    Color color = Colors.red;

    switch (strength) {
      case PasswordStrength.weak:
        activeBars = 1;

        color = Colors.red;
        break;
      case PasswordStrength.medium:
        activeBars = 2;

        color = Colors.orange;
        break;
      case PasswordStrength.strong:
        activeBars = 3;

        color = Colors.blue;
        break;
      case PasswordStrength.best:
        activeBars = 4;

        color = Colors.green;
        break;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // prevent Row from expanding
      children: [
        // Bar group
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            // Generate 4 bars based on the strength
            children: List.generate(4, (index) {
              // If index is less than activeBars, show colored bar, else show grey bar
              return Container(
                width: 20.w,
                height: 8.h,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: index < activeBars ? color : AppColors.grey300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
