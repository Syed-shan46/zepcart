import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/localization/app_strings_notification.dart';
import 'package:zepcart/features/notification/presentation/widgets/notification_tile.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(title: AppStringsNotifications.notificationTitle),

      body: ListView(
        padding: EdgeInsets.all(AppSizes.spacing.md),
        children: const [
          NotificationTile(
            icon: Icons.check_circle,
            iconColor: AppColors.success,
            title: AppStringsNotifications.bestOfferTitle,
            subtitle: AppStringsNotifications.bestOfferSubtitle,
          ),
          NotificationTile(
            icon: Icons.warning,
            iconColor: AppColors.warning,
            title: AppStringsNotifications.warningTitle,
            subtitle: AppStringsNotifications.warningSubtitle,
          ),
          NotificationTile(
            icon: Icons.check_circle,
            iconColor: AppColors.success,
            title: AppStringsNotifications.congratulationsTitle,
            subtitle: AppStringsNotifications.congratulationsSubtitle,
          ),
          NotificationTile(
            icon: Icons.info,
            iconColor: AppColors.info,
            title: AppStringsNotifications.didYouKnowTitle,
            subtitle: AppStringsNotifications.didYouKnowSubtitle,
          ),
          NotificationTile(
            icon: Icons.error,
            iconColor: AppColors.error,
            title: AppStringsNotifications.errorTitle,
            subtitle: AppStringsNotifications.errorSubtitle,
          ),
          NotificationTile(
            icon: Icons.check_circle,
            iconColor: AppColors.success,
            title: AppStringsNotifications.bestOfferTitle,
            subtitle: AppStringsNotifications.bestOfferSubtitle,
            faded: true,
          ),
          NotificationTile(
            icon: Icons.info,
            iconColor: AppColors.info,
            title: AppStringsNotifications.didYouKnowTitle,
            subtitle: AppStringsNotifications.didYouKnowSubtitle,
            faded: true,
          ),
        ],
      ),
    );
  }
}
