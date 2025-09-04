import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/core/helpers/password_strength_checker.dart';
import 'package:zepcart/features/authentication/presentation/widgets/headers/auth_header_text.dart';
import 'package:zepcart/shared/widgets/input_fields/app_form_textfield.dart';
import 'package:zepcart/features/authentication/presentation/widgets/inputs/password_strength_indicator.dart';
import 'package:zepcart/shared/widgets/appbars/app_custom_appbar_with_clip.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Controllers for handling user input
  final newPasswordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  PasswordStrength passwordStrength = PasswordStrength.weak;

  // Key to validate the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom Appbar With Clip
      appBar: AppCustomAppBarWithClip(title: AppStrings.validation),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding.page),

          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.spacing.betweenItems),

                // Header Text
                AuthHeaderText(
                  heading: AppStringsAuth.resetPasswordTitle,
                  subtitle: AppStringsAuth.resetPasswordSubtitle,
                ),
                SizedBox(height: AppSizes.spacing.betweenItems),

                // New Password Input Field
                AppFormTextField(
                  prefixIcon: Icons.password,
                  controller: newPasswordController,
                  labelText: AppStringsAuth.newPasswordLabel,
                ),
                SizedBox(height: AppSizes.inputField.spaceBetween),

                // Repeat Password Input Field
                AppFormTextField(
                  prefixIcon: Icons.password,
                  controller: repeatPasswordController,
                  labelText: AppStringsAuth.repeatPasswordLabel,
                ),
                SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                // Password Strength Indicator
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.padding.xs),
                  child: PasswordStrengthIndicator(strength: passwordStrength),
                ),
                SizedBox(height: AppSizes.inputField.spaceBetween),

                // Primary Button to change password
                AppPrimaryButton(
                  text: AppStringsAuth.changePassword,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
