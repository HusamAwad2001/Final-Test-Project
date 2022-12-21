import 'package:final_test_project/models/products_models.dart';
import 'package:final_test_project/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductsModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productsModelsFromJson(jsonData);
    } else {
      debugPrint('Failed to product load');
      return [];
    }
  }
}
