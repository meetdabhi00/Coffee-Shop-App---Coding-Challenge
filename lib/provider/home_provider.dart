import 'package:coffee_shop_app_coding_challenge/data/dummy_data/dummy_data.dart';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String selectedCategory = '';
  String selectedProductSize = '';

  List<Product> allProducts = generateDummyProducts();
  List<Product> favoriteProductList = [];
  List<Product> searchProductList = [];
  Map<String, List<Product>> productsByCategory = {};

  void filterProductByCategory() {
    productsByCategory = {};
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

  void selecProductSize({required String produtSize}) {
    selectedProductSize = produtSize;
    notifyListeners();
  }

  void addFavoriteProdctList({required String id}) {
    List<Product> tempList = [];
    tempList.addAll(allProducts);

    for (var product in tempList) {
      if (product.id == id) {
        bool isFavorite = product.isFavorite;
        if (!isFavorite) {
          favoriteProductList.add(product);
        } else {
          bool avlibleProduct =
              favoriteProductList.any((element) => element.id == id);
          if (avlibleProduct) {
            favoriteProductList.removeWhere((element) => element.id == id);
          }
        }
        product.isFavorite = !isFavorite;
      }
    }
    notifyListeners();
  }

  void searchProduct({required String text}) {
    searchProductList = [];
    List<Product> tempList = allProducts
        .where((product) =>
            product.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
    searchProductList.addAll(tempList);
    notifyListeners();
  }
}
