import 'package:flutter/material.dart';
import 'package:zepcart/core/common/assets/app_images.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';

// A Flutter widget displaying a circular user avatar with an edit icon overlay.
// The edit icon is positioned at the bottom-right to indicate profile picture editing.

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main user profile avatar
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.grey100,
          backgroundImage: const AssetImage(AppImages.userImage), // Static user image
        ),

        // Positioned edit icon in the bottom-right corner
        Positioned(
          bottom: 0,
          right: 4,
          child: Container(
            padding: EdgeInsets.all(AppSizes.padding.smd / 2),
            decoration: BoxDecoration(shape: BoxShape.circle, color: context.colors.primary),
            child: Icon(Icons.edit, size: AppSizes.font.lg, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
