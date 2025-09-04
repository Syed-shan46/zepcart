import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_address.dart';
import 'package:zepcart/core/common/localization/app_strings_checkout.dart';
import 'package:zepcart/shared/widgets/input_fields/app_textfield.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  String selectedType = "Home"; // Default selected type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with Title
      appBar: AppBar(
        title: Text(AppStringsCheckout.addAddressTitle),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.md),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address Type Section
              Text(
                "Address Type",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              Row(
                children: [
                  _buildAddressTypeChip(AppStringsAddress.home),
                  SizedBox(width: 8),
                  _buildAddressTypeChip(AppStringsAddress.office),
                  SizedBox(width: 8),
                  _buildAddressTypeChip(AppStringsAddress.other),
                ],
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Personal Info Section
              Text(
                "Personal Information",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              AppTextfield(label: AppStringsCheckout.firstNameLabel),
              SizedBox(height: AppSizes.inputField.spaceBetween),

              AppTextfield(label: AppStringsCheckout.lastNameLabel),
              SizedBox(height: AppSizes.inputField.spaceBetween),
              AppTextfield(
                label: AppStringsCheckout.emailLabel,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppSizes.inputField.spaceBetween),

              AppTextfield(
                label: AppStringsCheckout.phoneNumberLabel,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              // Address Info Section
              Text(
                AppStringsAddress.addresInfo,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: AppSizes.spacing.lg),

              AppTextfield(label: AppStringsCheckout.addressLabel),
              SizedBox(height: AppSizes.inputField.spaceBetween),

              AppTextfield(label: AppStringsCheckout.cityLabel),
              SizedBox(height: AppSizes.inputField.spaceBetween),

              AppTextfield(label: AppStringsCheckout.zipCodeLabel),
              SizedBox(height: AppSizes.spacing.lg),

              // Submit Button
              AppPrimaryButton(
                text: AppStringsCheckout.submitButton,
                onPressed: () => Get.toNamed(AppRoutes.checkout),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Address Type Chips
  Widget _buildAddressTypeChip(String type) {
    final isSelected = selectedType == type;
    return ChoiceChip(
      label: Text(type),
      selected: isSelected,
      onSelected: (_) {
        setState(() {
          selectedType = type;
        });
      },
      selectedColor: context.colors.primary.withAlpha(
        AppOpacities.almostTransparent,
      ),
      labelStyle: context.text.bodySmall
        ?..copyWith(
          color: isSelected ? context.colors.primary : AppColors.black,
        ),
    );
  }
}
