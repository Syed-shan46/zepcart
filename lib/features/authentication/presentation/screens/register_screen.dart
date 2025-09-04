import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_auth.dart';
import 'package:zepcart/core/helpers/password_strength_checker.dart';
import 'package:zepcart/features/authentication/presentation/widgets/already_have_account_text.dart';
import 'package:zepcart/features/authentication/presentation/widgets/headers/auth_header_text.dart';
import 'package:zepcart/shared/widgets/input_fields/app_form_textfield.dart';
import 'package:zepcart/features/authentication/presentation/widgets/inputs/password_strength_indicator.dart';
import 'package:zepcart/shared/widgets/appbars/app_custom_appbar_with_clip.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for handling user input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    locationController.dispose();
    bioController.dispose();
    super.dispose();
  }

  // Key to validate the form
  final _formKey = GlobalKey<FormState>();

  // Password strength variable
  PasswordStrength _passwordStrength = PasswordStrength.weak;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom Appbar With Clip
      appBar: AppCustomAppBarWithClip(
        title: AppStringsAuth.register,
        isCentered: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding.page),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.spacing.betweenItems),

                // Welcome Heading
                AuthHeaderText(
                  heading: AppStringsAuth.welcomeHeading,
                  subtitle: AppStringsAuth.welcomeSubtitle,
                ),
                SizedBox(height: AppSizes.spacing.betweenItems * 3),

                // Username Input Field
                AppFormTextField(
                  controller: usernameController,
                  labelText: AppStringsAuth.username,
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: AppSizes.inputField.spaceBetween),

                // Email Input Field
                AppFormTextField(
                  controller: emailController,
                  labelText: AppStringsAuth.emailAddress,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: AppSizes.inputField.spaceBetween),

                // Password Input Field
                AppFormTextField(
                  controller: passwordController,
                  labelText: AppStringsAuth.password,
                  obscureText: true,
                  prefixIcon: Icons.lock_outline,
                  onChanged: (value) {
                    setState(() {
                      _passwordStrength = checkPasswordStrength(value);
                    });
                  },
                ),
                SizedBox(height: AppSizes.spacing.xs),

                // Password Hint Text
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.padding.sm),
                  child: Text(
                    AppStringsAuth.passwordRequirement,
                    style: context.text.labelSmall?.copyWith(
                      fontSize: 10.sp,
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spacing.betweenItemsSmall),

                // Password Strength Indicator
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.padding.sm),
                  child: PasswordStrengthIndicator(strength: _passwordStrength),
                ),
                SizedBox(height: AppSizes.spacing.betweenSections),

                // Create Account Button
                AppPrimaryButton(
                  text: AppStringsAuth.createAccount,
                  onPressed: () {},
                ),
                SizedBox(height: AppSizes.spacing.betweenItems),

                // Already have an account? Link to go to Login screen
                AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
