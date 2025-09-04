import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/features/settings/presentation/widgets/logout_show_dialog.dart';
import 'package:zepcart/features/settings/presentation/widgets/setting_switch_tile.dart';
import 'package:zepcart/features/settings/presentation/widgets/setting_tile.dart';
import 'package:zepcart/features/settings/presentation/widgets/settings_section_card.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsSettings.settingsTitle),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.padding.md),
        children: [
          // Account Section
          SettingsSectionCard(
            children: [
              SettingsTile(
                icon: Icons.person_outline,
                title: AppStringsSettings.editProfile,
                onTap: () {
                  Get.toNamed(AppRoutes.editProfile);
                },
              ),
              SettingsTile(
                icon: Icons.lock_outline,
                title: AppStringsSettings.changePassword,
                onTap: () => Get.toNamed(AppRoutes.changePassword),
              ),

              SettingsTile(
                icon: Icons.location_on_outlined,
                title: AppStringsSettings.savedAddresses,
                onTap: () => Get.toNamed(AppRoutes.savedAddress),
              ),

              SettingsTile(
                icon: CupertinoIcons.shopping_cart,
                title: AppStringsSettings.orders,
                onTap: () => Get.toNamed(AppRoutes.myOrders),
              ),
            ],
          ),

          // Notifications
          SettingsSectionCard(
            children: [
              SettingsSwitchTile(
                icon: Icons.notifications_outlined,
                title: AppStringsSettings.pushNotifications,
                value: true,
              ),

              SettingsSwitchTile(
                icon: Icons.sms_outlined,
                title: AppStringsSettings.smsAlerts,
                value: false,
              ),

              SettingsSwitchTile(
                icon: Icons.email_outlined,
                title: AppStringsSettings.promotionalEmails,
                value: true,
              ),
            ],
          ),

          // Privacy & Security
          SettingsSectionCard(
            children: [
              SettingsTile(
                icon: Icons.privacy_tip_outlined,
                title: AppStringsSettings.privacyPolicy,
                onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
              ),

              SettingsTile(
                icon: Icons.rule_outlined,
                title: AppStringsSettings.termsAndConditions,
                onTap: () => Get.toNamed(AppRoutes.termsAndConditions),
              ),
            ],
          ),

          // Preferences
          SettingsSectionCard(
            children: [
              //SettingsTile(icon: Icons.language_outlined, title: AppStringsSettings.language),
              SettingsTile(
                icon: Icons.brightness_6_outlined,
                title: AppStringsSettings.theme,
                onTap: () {
                  Get.toNamed(AppRoutes.appearance);
                },
              ),

              SettingsTile(
                icon: Icons.monetization_on_outlined,
                title: AppStringsSettings.currency,
              ),
            ],
          ),

          // Support
          SettingsSectionCard(
            children: [
              SettingsTile(
                icon: Icons.help_outline,
                title: AppStringsSettings.helpCentre,
                onTap: () => Get.toNamed(AppRoutes.help),
              ),

              SettingsTile(
                icon: Icons.contact_support_outlined,
                title: AppStringsSettings.contactUs,
                onTap: () => Get.toNamed(AppRoutes.chatSupport),
              ),

              SettingsTile(
                icon: Icons.star_rate_outlined,
                title: AppStringsSettings.rateUs,
                onTap: () => Get.toNamed(AppRoutes.rateUs),
              ),
            ],
          ),

          // Danger Zone
          SettingsSectionCard(
            children: [
              SettingsTile(
                icon: Icons.info,
                title: AppStringsSettings.aboutApp,
              ),

              SettingsTile(
                icon: Icons.logout_outlined,
                title: AppStringsSettings.logout,
                isDestructive: true,
                onTap: () {
                  showLogoutConfirmationDialog(context, () {});
                },
              ),
            ],
          ),

          SizedBox(height: AppSizes.spacing.betweenSections),
        ],
      ),
    );
  }
}
