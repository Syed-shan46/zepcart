import 'package:flutter/material.dart';
import 'package:flutter_steps/flutter_steps.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_get_steps.dart';

// A Flutter widget displaying a horizontal stepper header for checkout progress using the FlutterSteps package.
// Visually indicates the current step and progress with customizable colors and styles.
class CheckoutStepperHeader extends StatelessWidget {
  final int currentStep;

  const CheckoutStepperHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),

      // Stepper Header using FlutterSteps package
      child: FlutterSteps(
        steps: getSteps(currentStep), // Get step widgets dynamically
        direction: Axis.horizontal, // Horizontal orientation
        leadingSize: 25, // Icon size
        dashFillRate: 0.2, // Dash animation fill (if any)
        titleFontSize: AppSizes.font.xs, // Step label font size
        leadingSizeFactor: 2.5, // Space factor for leading circle
        isStepLineDashed: true, // Dashed line between steps
        titleActiveColor: context.colors.onSurface, // Active label color
        titleInactiveColor: AppColors.grey, // Inactive label color
        activeStepLineColor: AppColors.grey, // Line color after completed steps
        inactiveStepLineColor: AppColors.grey, // Line color for upcoming steps
        isStepLineContinuous: false, // Connect all steps with continuous line
        
      ),
    );
  }
}
