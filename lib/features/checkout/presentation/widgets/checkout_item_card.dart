import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';

/// A Flutter widget displaying a product image card for checkout items.
/// If [extraCount] is provided, it shows a "+N" card instead of an image.
class CheckoutItemCard extends ConsumerWidget {
  const CheckoutItemCard({super.key, required this.imagePath, this.extraCount});

  final String imagePath;
  final int? extraCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.checkoutItems),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(8),
        decoration: AppBoxDecoration.dynamic(context),
        width: 65,
        height: 65,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Product image
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(child: CircularProgressIndicator(strokeWidth: 2));
              },
            ),

            // Overlay only if extra items exist
            if (extraCount != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(AppOpacities.almostTransparent),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius.lg),
                ),
                alignment: Alignment.center,
                child: Text(
                  "+$extraCount",
                  style: context.text.bodyMedium?.copyWith(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
