import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/features/home/repositories/product_repository.dart';
import 'package:zepcart/core/services/fakestore_service.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(FakeStoreService());
});

final productListProvider = FutureProvider<List<ProductModel>>((ref) {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getProducts();
});
