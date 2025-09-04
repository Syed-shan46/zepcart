import 'package:easy_bi_stepper/easy_bi_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';

// A Flutter widget displaying a horizontal stepper indicating the current status of an order.
// Visually distinguishes completed, active, and upcoming steps with custom icons and colors.
class OrdersStepper extends StatelessWidget {
  const OrdersStepper({super.key});

  // The index of the current active step.
  final int activeIndex = 2;

  // Labels for each step of the order process.
  final List<String> labels = const [
    AppStringsOrder.packed,
    AppStringsOrder.accepted,
    AppStringsOrder.inProgress,
    AppStringsOrder.delivery,
  ];

  @override
  Widget build(BuildContext context) {
    // Generate StepperData for each label
    final stepperData = List.generate(labels.length, (index) {
      final isCompleted = index < activeIndex;
      final isActive = index == activeIndex;

      // Icon based on step status
      Widget icon =
          isCompleted
              ? Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(shape: BoxShape.circle, color: context.colors.primary),
              )
              : isActive
              ? Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.primary, width: 2),
                ),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.colors.primary),
                ),
              )
              : Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.grey),
              );

      return StepperData(
        iconWidget: icon,
        title: Text(labels[index], style: context.text.labelSmall, textAlign: TextAlign.center),
      );
    });

    // Stepper display
    return SizedBox(
      height: 55.h,
      child: EasyBiStepper(
        stepperList: stepperData,
        activeIndex: activeIndex,
        stepperDirection: Axis.horizontal,
        activeBarColor: context.colors.primary,
        inActiveBarColor: AppColors.grey400,
        barThickness: 3,
        iconHeight: 12,
        iconWidth: 12,
        verticalGap: AppSizes.spacing.xs,
        scrollPhysics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
