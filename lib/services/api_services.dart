import 'package:dio/dio.dart';
import 'package:login_course_app/utils/url_constants.dart';

import '../models/products_models.dart';

class APIService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts({int limit = 5}) async {
    try {
      final response = await _dio.get("${UrlConstants.base_url}/products?limit=$limit");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<Product> fetchProductById(int productId) async {
    try {
      final response = await _dio.get("${UrlConstants.base_url}/products/$productId");
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      final response = await _dio.get("${UrlConstants.base_url}/products/categories");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return List<String>.from(data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    try {
      final response = await _dio.get("${UrlConstants.base_url}/products/category/$category");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<List<dynamic>> fetchSearchProducts(String searchTerm) async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products?title=$searchTerm');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Error fetching data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}

