import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Wait 5 seconds, then trigger callback
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      widget.onComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.padding.lg),
      child: Column(
        children: [
          // Lottie Animation
          Lottie.asset(
            AppImages.paymentSuccessAnimation,
            width: 180.w,
            height: 180.w,
            repeat: false,
          ),
          SizedBox(height: AppSizes.spacing.lg),

          // Success Message
          Text(
            AppStringsCheckout.success,
            style: context.text.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.success,
            ),
          ),
          SizedBox(height: AppSizes.spacing.sm),

          // Redirect Summary
          Text(
            AppStringsCheckout.redirectingToSummary,
            textAlign: TextAlign.center,
            style: context.text.bodyMedium,
          ),
        ],
      ),
    );
  }
}
