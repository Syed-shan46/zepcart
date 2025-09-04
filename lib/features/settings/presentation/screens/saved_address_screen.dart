import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_address.dart';
import 'package:zepcart/features/settings/data/address_data.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/cards/saved_address_card.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

// Screen to display the list of saved addresses and allow users to select, edit, delete,
class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  int selectedIndex = 0;

  void _setAsDefault() {
    setState(() {
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = addresses[i].copyWith(isDefault: i == selectedIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with TItle
      appBar: PrimaryAppbar(
        title: AppStringsAddress.savedAddressesTitle,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSizes.spacing.sm),
            child: IconButton(
              onPressed: () => Get.toNamed(AppRoutes.addAddress),
              icon: Icon(Icons.add, size: AppSizes.font.xxl),
            ),
          ),
        ],
      ),

      // Address list body
      body: ListView.builder(
        padding: EdgeInsets.all(AppSizes.padding.md),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];

          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            // Saved Adress Card
            child: SavedAddressCard(
              address: address,
              isSelected: selectedIndex == index,
              onEdit: () {},
              onDelete: () {},
            ),
          );
        },
      ),

      // Set as Default Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),
        child: AppPrimaryButton(
          text: AppStringsAddress.setAsDefault,
          onPressed: _setAsDefault,
        ),
      ),
    );
  }
}
