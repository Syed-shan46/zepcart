import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/features/product_detail/domain/controllers/product_image_controller.dart';

class ProductImageDots extends StatelessWidget {
  final int dotCount;
  const ProductImageDots({
    super.key,
    required this.controller,
    required this.dotCount,
  });

  // Controller
  final ProductImageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < dotCount; i++)
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.carousalCurrentIndex.value == i
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
