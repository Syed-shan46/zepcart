import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_offsets.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_category.dart';
import 'package:zepcart/features/categories/domain/models/category_model.dart';
import 'package:zepcart/features/categories/presentation/providers/category_provider.dart';
import 'package:zepcart/shared/styles/app_box_decoration.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';
import 'package:zepcart/shared/widgets/list/app_grid_view.dart';

class CategoryListScreen extends ConsumerWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final selectedIndex = ref.watch(selectedCategoryIndexProvider);

    return Scaffold(
      appBar: PrimaryAppbar(title: AppStringsCategory.allCategoriesTitle),
      body: Column(
        children: [
          // Top Horizontal Category List
          SizedBox(
            height: 48, // small height like tabs
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == selectedIndex;

                return CategoryTabs(
                  isSelected: isSelected,
                  category: category,
                  index: index,
                );
              },
            ),
          ),

          // Subcategories Grid
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final categories = ref.watch(categoriesProvider);
                final selectedIndex = ref.watch(selectedCategoryIndexProvider);

                return AppGridView(
                  padding: EdgeInsets.all(AppSizes.screenPadding),
                  itemCount: categories[selectedIndex].subCategories.length,
                  crossAxisCount: 3, // 3 per row
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                  mainAxisSpacing: 12,
                  itemBuilder: (context, index) {
                    final sub = categories[selectedIndex].subCategories[index];
                    return SubCategoriesGrid(sub: sub);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTabs extends ConsumerWidget {
  const CategoryTabs({
    super.key,
    required this.isSelected,
    required this.category,
    required this.index,
  });

  final bool isSelected;
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryIndexProvider.notifier).state = index;
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.spacing.sm,
          vertical: AppSizes.spacing.xs + AppOffsets.nudgeSM,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding.md,
          vertical: AppSizes.padding.sm,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius.md),
          color: isSelected ? context.colors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : context.colors.outline,
          ),
        ),
        child: Center(
          child: Text(
            category.title,
            style: context.text.titleSmall?.copyWith(
              color: isSelected ? AppColors.white : context.colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoriesGrid extends StatelessWidget {
  const SubCategoriesGrid({super.key, required this.sub});

  final SubCategoryModel sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.dynamic(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(sub.imageUrl, width: 50, height: 50, fit: BoxFit.cover,color: context.colors.onSurface,),
          SizedBox(height: AppSizes.spacing.sm),
          Text(
            sub.title,
            style: context.text.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
