import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/features/categories/domain/models/category_model.dart';
import 'package:zepcart/features/home/presentation/widgets/themed_avatar.dart';
import 'package:zepcart/routes/app_routes.dart';

// A single category tile displayed on the home screen.
class HomeCategoryTile extends StatelessWidget {
  const HomeCategoryTile({super.key, required this.category});
  //The category data model (title + image URL).
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.sm),

      child: Column(
        children: [
          // Category avatar (clickable)
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.searchResults),

            // Themed circular avatar background
            child: ThemedAvatar(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.padding.xs),
                // Category image loaded from API
                child: Image.asset(category.imageUrl),
              ),
            ),
          ),

          SizedBox(height: AppSizes.spacing.xs),

          // Category title text
          Text(
            category.title,
            style: context.text.titleSmall?.copyWith(fontSize: 10.sp),
            overflow: TextOverflow.ellipsis, // Prevents text overflow
          ),
        ],
      ),
    );
  }
}
