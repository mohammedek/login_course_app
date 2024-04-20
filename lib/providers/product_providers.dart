import 'package:flutter/material.dart';

import '../models/products_models.dart';
import '../services/api_services.dart';

class ProductsProvider extends ChangeNotifier {
  final APIService _apiService = APIService();
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      _products = await _apiService.fetchProducts();
      notifyListeners();
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }
}
