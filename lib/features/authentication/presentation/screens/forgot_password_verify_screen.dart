import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/features/authentication/presentation/widgets/buttons/resend_code_button.dart';
import 'package:zepcart/features/authentication/presentation/widgets/headers/auth_header_text.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/app_custom_appbar_with_clip.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

// Screen where user enters OTP to verify before resetting password
class ForgotPasswordVerifyScreen extends StatefulWidget {
  final String email;
  const ForgotPasswordVerifyScreen({super.key, required this.email});

  @override
  State<ForgotPasswordVerifyScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<ForgotPasswordVerifyScreen> {
  String enteredOtp = "";
  int resendSeconds = 30;
  Timer? timer;

  // Key to validate the form
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startResendCountdown();
  }

  // Starts a countdown timer for resending OTP
  void startResendCountdown() {
    resendSeconds = 30;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          resendSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar With Clip
      appBar: AppCustomAppBarWithClip(title: AppStringsAuth.forgotPassword),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.page),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: AppSizes.spacing.betweenItems),
              // Title section (heading + subtitle)
              AuthHeaderText(
                heading: AppStringsAuth.forgotPasswordHeading,
                subtitle: AppStringsAuth.forgotPasswordSubtitle(widget.email),
              ),
              SizedBox(height: AppSizes.spacing.betweenItems),

              // OTP input fields
              buildOtpTextField(),
              SizedBox(height: AppSizes.spacing.betweenItems),

              // Continue button to proceed
              AppPrimaryButton(
                text: AppStrings.continueText,
                onPressed: () => Get.toNamed(AppRoutes.resetPassword),
              ),
              SizedBox(height: AppSizes.spacing.betweenItems),

              // Resend OTP button with timer
              ResendCodeButton(resendSeconds: resendSeconds),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the OTP text field widget
  OtpTextField buildOtpTextField() {
    return OtpTextField(
      numberOfFields: 6,
      borderColor: AppColors.primary,
      focusedBorderColor: AppColors.primaryDark,
      showFieldAsBox: false,
      borderWidth: 2.0,
      onSubmit: (code) {
        enteredOtp = code;
      },
      onCodeChanged: (code) {
        enteredOtp = code;
      },
    );
  }
}
