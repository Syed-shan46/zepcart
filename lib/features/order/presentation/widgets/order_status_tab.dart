import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_order.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/features/order/presentation/providers/order_provider.dart';

/// A horizontal tab widget to filter orders by status.
/// Useful for switching between processing, picking, shipping, and delivered orders.
class OrderStatusTab extends ConsumerWidget {
  const OrderStatusTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allOrders = ref.watch(allOrdersProvider);
    final selectedStatus = ref.watch(selectedStatusProvider);

    final statuses = [
      AppStringsOrder.processing,
      AppStringsOrder.picking,
      AppStringsOrder.shipping,
      'Delivered',
    ];

    return SizedBox(
      height: 40, // fix height for tab row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final label = statuses[index];
          final count = allOrders.where((o) => o.status == label).length;
          final isActive = selectedStatus == label;

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? AppSizes.spacing.sm : AppSizes.spacing.xs,
              right: AppSizes.spacing.xs,
            ),
            child: GestureDetector(
              onTap:
                  () => ref.read(selectedStatusProvider.notifier).state = label,
              child: buildTab(context, label, count, isActive),
            ),
          );
        },
      ),
    );
  }

  Widget buildTab(
    BuildContext context,
    String label,
    int count,
    bool isActive,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.padding.smd,
        vertical: AppSizes.padding.smd / 2,
      ),
      decoration: BoxDecoration(
        color:
            isActive
                ? context.colors.primary.withAlpha(AppOpacities.veryLowOpaque)
                : context.colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius.lg),
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.bodySmall(context)),
          SizedBox(width: AppSizes.spacing.xs),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.padding.xs,
              vertical: AppSizes.padding.xs / 2,
            ),
            decoration: BoxDecoration(
              color: isActive ? context.colors.primary : AppColors.grey,
              borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
            ),
            child: Text(
              '$count',
              style: context.text.bodySmall?.copyWith(
                color: AppColors.textWhite,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
