import 'dart:async';
import 'package:flutter/material.dart';

import '../services/api_services.dart';


class SearchState extends ChangeNotifier {
  Timer? _debounceTimer;
  String searchText = '';
  List<dynamic> searchResults = [];
  final APIService _apiService = APIService();

  void onSearchTextChanged(String searchTerm) {
    if (searchTerm.length < 3) {
      searchResults = [];
      notifyListeners();
      return;
    }
    searchText = searchTerm;
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      fetchSearchData(searchTerm);
    });
  }

  Future<void> fetchSearchData(String searchTerm) async {
    searchResults = await _apiService.fetchSearchProducts(searchTerm);
    notifyListeners();
  }
}
