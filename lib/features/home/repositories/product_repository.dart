import 'package:zepcart/features/home/domain/models/product_model.dart';
import 'package:zepcart/core/services/fakestore_service.dart';

class ProductRepository {
  final FakeStoreService _service;

  ProductRepository(this._service);

  Future<List<ProductModel>> getProducts() => _service.fetchProducts();
}
