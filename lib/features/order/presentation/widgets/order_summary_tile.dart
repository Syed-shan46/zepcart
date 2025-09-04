// items: list of maps: { "product": ProductModel, "quantity": int }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/cart/presentation/providers/cart_provider.dart';
import 'package:zepcart/features/order/presentation/widgets/ordered_items.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';

class OrderSummaryTile extends ConsumerStatefulWidget {
  final String title;

  const OrderSummaryTile({super.key, required this.title});

  @override
  ConsumerState<OrderSummaryTile> createState() => _OrderSummaryTileState();
}

class _OrderSummaryTileState extends ConsumerState<OrderSummaryTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final itemCount = cart.length;

    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          // when collapsed
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
        ),
        shape: RoundedRectangleBorder(
          // when expanded
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: AppSizes.padding.sm,vertical: AppSizes.padding.xs),
        childrenPadding: EdgeInsets.all(AppSizes.padding.sm),
        backgroundColor: AppColors.transparent,
        // control expansion state to toggle custom trailing icon
        onExpansionChanged:
            (expanded) => setState(() => _isExpanded = expanded),

        // Title (left)
        title: Text(widget.title, style: AppTextStyles.bodyMedium(context)),

        // Trailing (right) — show count + chevron
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (itemCount > 1)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  '+${itemCount - 1} more',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
          ],
        ),

        // children: render each item using your unchanged OrderedItems widget
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            shrinkWrap: true,

            separatorBuilder:
                (_, __) => SizedBox(height: AppSizes.spacing.betweenItems),
            itemBuilder: (context, index) {
              final item = cart[index];
              return OrderedItems(
                product: item.product,
                quantity: item.quantity,
              );
            },
          ),
        ],
      ),
    );
  }
}
