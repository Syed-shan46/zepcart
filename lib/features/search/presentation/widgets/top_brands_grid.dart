import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_search.dart';
import 'package:zepcart/features/search/data/top_brands_data.dart';
import 'package:zepcart/routes/app_routes.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/list/app_grid_view.dart';

// A Flutter widget displaying a grid of top brand logos with their names in a 4-column layout.
// Allows users to tap a brand to navigate to corresponding search results.
class TopBrandsGrid extends StatelessWidget {
  const TopBrandsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header for section
        Text(AppStringsSearch.topBrands, style: context.text.titleMedium),
        SizedBox(height: AppSizes.spacing.betweenItems),

        // Grid of brand logos and names
        AppGridView(
          itemCount: topBrands.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4, // 4 logos per row
          mainAxisSpacing: AppSizes.spacing.sm,
          crossAxisSpacing: AppSizes.spacing.sm,
          childAspectRatio: 1, // Square cells

          itemBuilder: (context, index) {
            final brand = topBrands[index];

            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.searchResults),

              child: Column(
                children: [
                  // Circular logo container
                  Container(
                    width: 48.w,
                    height: 48.h,
                    padding: EdgeInsets.all(AppSizes.padding.sm),
                    decoration: BoxDecoration(
                      color: context.colors.surfaceContainerHigh,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(brand['logo']!, fit: BoxFit.contain),
                  ),
                  SizedBox(height: AppSizes.spacing.xs),

                  // Brand name
                  Text(brand['name']!, style: AppTextStyles.bodySmall(context)),
                ],
              ),
            );
          },
        ),

        // Space after section
        SizedBox(height: AppSizes.spacing.betweenItems),
      ],
    );
  }
}
