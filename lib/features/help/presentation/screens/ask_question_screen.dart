import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_help.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/input_fields/app_textfield.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({super.key});

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  // GlobalKey to manage form state and validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _emailController.dispose();
    _questionController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsHelp.askQuestionTitle),
      body: SingleChildScrollView(
        // Prevent keyboard overflow
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding.md),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Optional Name Field
                AppTextfield(
                  controller: _nameController,
                  label: AppStringsHelp.nameLabel,
                ),
                SizedBox(height: AppSizes.spacing.md),

                // Email Field with basic validation
                AppTextfield(
                  controller: _emailController,
                  label: AppStringsHelp.emailLabel,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: AppSizes.spacing.md),

                // Question Field
                AppTextfield(
                  controller: _questionController,
                  label: AppStringsHelp.questionLabel,
                  maxLines: 5,
                ),
                SizedBox(height: AppSizes.spacing.lg),

                // Submit Button with validation logic
                SizedBox(
                  width: double.infinity,
                  child: AppPrimaryButton(
                    text: AppStringsHelp.submitButton,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
