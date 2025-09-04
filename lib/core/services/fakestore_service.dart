import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zepcart/features/home/domain/models/product_model.dart';

class FakeStoreService {
  final String _baseUrl = "https://fakestoreapi.com";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("$_baseUrl/products"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
