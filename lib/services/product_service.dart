import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import '../core/constants.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('${AppConstants.baseUrl}/products/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
