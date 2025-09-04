import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/features/authentication/presentation/widgets/headers/auth_header_text.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/app_custom_appbar_with_clip.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';
import 'package:zepcart/shared/widgets/input_fields/app_form_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for handling user input
    final TextEditingController emailController = TextEditingController();

    // Key to validate the form
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      // Custom Appbar With Clip
      appBar: AppCustomAppBarWithClip(
        title: AppStringsAuth.forgotPassword,
        isCentered: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: AppSizes.spacing.betweenItems),
                // Title and subtitle (header)
                AuthHeaderText(
                  heading: AppStringsAuth.resetPasswordTitle,
                  subtitle: AppStringsAuth.resetPasswordSubtitle,
                ),
                SizedBox(height: AppSizes.spacing.betweenSections),

                // Email text input field
                AppFormTextField(
                  controller: emailController,
                  labelText: AppStringsAuth.emailAddress,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: AppSizes.inputField.spaceBetween),

                // Button to send the reset email
                AppPrimaryButton(
                  text: AppStringsAuth.sendPasswordResetEmail,
                  onPressed: () => Get.toNamed(AppRoutes.otpVerification),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
