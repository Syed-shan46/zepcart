import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/features/settings/presentation/widgets/editing_profile_avatar.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/input_fields/app_form_textfield.dart';
import 'package:zepcart/shared/widgets/overlays/app_snackbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController(
    text: 'John Doe',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'john.doe@example.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+971 50 123 4567',
  );

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      AppSnackbar.success(context, 'Profile updated successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with Title
      appBar: const PrimaryAppbar(title: AppStringsSettings.editProfileTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.padding.lg),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Picture
              EditProfileAvatar(),
              SizedBox(height: AppSizes.spacing.lg),

              // Full Name
              AppFormTextField(
                controller: _nameController,
                labelText: 'Full Name',
                prefixIcon: Icons.person_outline,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Name cannot be empty'
                            : null,
              ),

              SizedBox(height: AppSizes.spacing.md),

              // Email Address
              AppFormTextField(
                controller: _emailController,
                labelText: AppStringsSettings.emailAddress,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              SizedBox(height: AppSizes.spacing.md),

              // Phone Number
              AppFormTextField(
                controller: _phoneController,
                labelText: AppStringsSettings.phoneNumber,
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Phone number is required'
                            : null,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Save Changes Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.primary,
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.padding.md,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadius.md,
                      ),
                    ),
                  ),
                  child: Text(
                    AppStringsSettings.saveChanges,
                    style: context.text.labelLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
