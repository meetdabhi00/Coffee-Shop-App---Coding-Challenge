import 'package:coffee_shop_app_coding_challenge/data/dummy_data/dummy_data.dart';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String selectedCategory = '';

  List<Product> allProducts = generateDummyProducts();
  Map<String, List<Product>> productsByCategory = {};

  void filterProductByCategory() {
    for (Product product in allProducts) {
      if (!productsByCategory.containsKey(product.category)) {
        productsByCategory[product.category] = [];
      }
      productsByCategory[product.category]?.add(product);
    }
  }

  void selecCategory({required String categoryName}) {
    selectedCategory = categoryName;
    filterProductByCategory();
    notifyListeners();
  }
}
