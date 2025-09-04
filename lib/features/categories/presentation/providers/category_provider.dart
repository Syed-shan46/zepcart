import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/mocks/data/categories_data.dart';
import 'package:zepcart/features/categories/domain/models/category_model.dart';

// Categories provider
final categoriesProvider = Provider<List<CategoryModel>>((ref) {
  // Later this can be replaced with API call
  return categoryList;
});

// Selected category index provider
final selectedCategoryIndexProvider = StateProvider<int>((ref) => 0);
