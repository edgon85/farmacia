import 'package:flutter/material.dart';

class CategoryDetailModel with ChangeNotifier {
  String _categoryName;
  String _categoryId;

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
    notifyListeners();
  }

  String get categoryId => _categoryId;

  set categoryId(String value) {
    _categoryId = value;
    notifyListeners();
  }
}
