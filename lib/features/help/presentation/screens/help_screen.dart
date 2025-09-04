// lib/features/help/screens/help_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_help.dart';
import 'package:zepcart/features/help/data/faq_data.dart';
import 'package:zepcart/features/help/presentation/widgets/custom_expandable_tile.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/buttons/app_primary_button.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsHelp.helpTitle),

      // FAQ list displayed in a scrollable list
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.md,
          vertical: AppSizes.padding.sm,
        ),
        itemCount: ecommerceFAQList.length,
        itemBuilder: (context, index) {
          final faq = ecommerceFAQList[index];
          // Custom expandable tile showing question & answer
          return CustomExpandableTile(
            title: faq['question']!,
            content: faq['answer']!,
          );
        },
      ),

      // Bottom button for asking a new question
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.padding.md),
        child: AppPrimaryButton(
          text: AppStringsHelp.askQuestion,
          onPressed: () => Get.toNamed(AppRoutes.askQuestion),
        ),
      ),
    );
  }
}
