import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:zepcart/features/checkout/presentation/screens/payment_success_screen.dart';
import 'package:zepcart/features/checkout/presentation/widgets/checkout_stepper_header.dart';
import 'package:zepcart/features/checkout/presentation/screens/payment_screen.dart';
import 'package:zepcart/features/order/presentation/screens/order_success_screen.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

// This widget manages the **entire checkout process**:
// It uses a simple **stateful step-based navigation** instead of routes.
class CheckoutFlowWrapper extends StatefulWidget {
  const CheckoutFlowWrapper({super.key});

  @override
  State<CheckoutFlowWrapper> createState() => _CheckoutFlowWrapperState();
}

class _CheckoutFlowWrapperState extends State<CheckoutFlowWrapper> {
  // Tracks the current step in the checkout flow
  int _currentStep = 0;

  // Moves to the specified step
  void _goToStep(int step) {
    setState(() => _currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    // The widget to show for each step
    Widget body;
    switch (_currentStep) {
      case 0:
        // Checkout (address + cart review)
        body = CheckoutScreen(onNext: () => _goToStep(1));
        break;
      case 1:
        // Payment
        body = PaymentScreen(onNext: () => _goToStep(2));
        break;
      case 2:
        body = PaymentSuccessScreen(onComplete: () => _goToStep(3));
        break;
      case 3:
        body = OrderConfirmationScreen();
        break;

      default:
        // Invalid step (fallback UI)
        body = const Center(child: Text(AppStringsCheckout.invalidStep));
    }

    final appBarTitle =
        _currentStep == 0 ? "Checkout" : "Payment Method";

    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: appBarTitle),

      // Checkout content
      body: Column(
        children: [
          // Custom stepper widget to show progress
          CheckoutStepperHeader(currentStep: _currentStep),
          SizedBox(height: AppSizes.spacing.md),

          // Actual screen content based on step
          Expanded(child: body),
        ],
      ),
    );
  }
}
