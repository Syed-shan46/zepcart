import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/core/mocks/data/categories_data.dart';
import 'package:zepcart/features/categories/domain/models/category_model.dart';

final categoryListProvider = FutureProvider<List<CategoryModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 2)); // simulate loading delay
  return categoryList; // your static or fetched list
});
