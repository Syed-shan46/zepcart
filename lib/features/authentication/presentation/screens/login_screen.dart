import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/features/authentication/presentation/widgets/buttons/google_login_button.dart';
import 'package:zepcart/features/authentication/presentation/widgets/buttons/register_prompt.dart';
import 'package:zepcart/features/authentication/presentation/widgets/texts/remember_forgot_row.dart';
import 'package:zepcart/features/authentication/presentation/widgets/texts/terms_and_privacy_text.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/features/authentication/presentation/widgets/headers/auth_header_text.dart';
import 'package:zepcart/shared/widgets/input_fields/app_form_textfield.dart';
import 'package:zepcart/shared/widgets/appbars/app_custom_appbar_with_clip.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for email and password input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Key to validate the form
  final _formKey = GlobalKey<FormState>();

  // State to hold "Remember me" checkbox value
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // Custom Appbar With Clip
          appBar: AppCustomAppBarWithClip(
            title: AppStringsAuth.screenTitle,
            isCentered: true,
            letterSpacing: 2,
            backArrow: false,
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSizes.padding.page),

            // Scrollable form area
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: AppSizes.spacing.betweenItems),

                    // Welcome text
                    AuthHeaderText(
                      heading: AppStringsAuth.welcomeBackHeading,
                      subtitle: AppStringsAuth.welcomeBackSubtitle,
                    ),
                    SizedBox(height: AppSizes.spacing.betweenItems * 3),

                    // Email input field
                    AppFormTextField(
                      controller: _emailController,
                      labelText: AppStringsAuth.emailAddress,
                      prefixIcon: Iconsax.user,
                    ),
                    SizedBox(height: AppSizes.inputField.spaceBetween),

                    // Password input field
                    AppFormTextField(
                      controller: _passwordController,
                      labelText: AppStringsAuth.password,
                      prefixIcon: Iconsax.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                    // Remember Me checkbox and Forgot Password button
                    RememberForgotRow(
                      rememberMe: _rememberMe,
                      onRememberChanged:
                          (value) =>
                              setState(() => _rememberMe = value ?? false),
                    ),
                    SizedBox(height: AppSizes.spacing.betweenItems),

                    // Login button
                    AppPrimaryButton(
                      text: AppStringsAuth.login,
                      onPressed: () {
                        // 🚨 Currently navigating to Forgot Password instead of handling login!
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(
                            AppRoutes.cupertinoBottomNav,
                          ); // Replace with actual route
                        }
                      },
                    ),
                    SizedBox(height: AppSizes.spacing.betweenSections),

                    // Don’t have account? Register
                    RegisterPromptWidget(),
                    SizedBox(height: AppSizes.spacing.betweenSections),

                    // Google login button
                    GoogleLoginButtonWidget(),
                    SizedBox(height: AppSizes.spacing.betweenSections),

                    // Terms and Privacy text
                    TermsAndPrivacyText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
