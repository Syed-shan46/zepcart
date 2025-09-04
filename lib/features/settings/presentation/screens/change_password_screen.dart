import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/features/authentication/presentation/widgets/headers/auth_header_text.dart';
import 'package:zepcart/shared/widgets/input_fields/app_form_textfield.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/app_custom_appbar_with_clip.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  // Controllers for handling user input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  // Key to validate the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with Clip
      appBar: AppCustomAppBarWithClip(
        title: AppStringsSettings.changePasswordTitle,
        isCentered: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.screenPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: AppSizes.spacing.betweenItems),

              // Top Text
              AuthHeaderText(
                heading: AppStringsSettings.changePassword,
                subtitle: AppStringsSettings.changePasswordSubtitle,
              ),
              SizedBox(height: AppSizes.spacing.betweenSections),

              // Current Password
              AppFormTextField(
                controller: currentPasswordController,
                labelText: AppStringsSettings.currentPassword,
                prefixIcon: Icons.password,
              ),
              SizedBox(height: AppSizes.inputField.spaceBetween),

              // New password
              AppFormTextField(
                controller: newPasswordController,
                labelText: AppStringsSettings.newpassword,
                prefixIcon: Icons.password,
              ),
              SizedBox(height: AppSizes.inputField.spaceBetween),

              // Email Textfield
              AppFormTextField(
                controller: emailController,
                labelText: AppStringsSettings.confirmPassword,
                prefixIcon: Icons.password,
              ),
              SizedBox(height: AppSizes.spacing.betweenSections),

              AppPrimaryButton(
                text: AppStringsSettings.changePassword,
                onPressed: () => Get.toNamed(AppRoutes.otpVerification),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
