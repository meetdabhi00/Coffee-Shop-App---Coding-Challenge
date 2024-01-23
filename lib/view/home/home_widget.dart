import 'package:coffee_shop_app_coding_challenge/data/dummy_data/dummy_data.dart';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class HomeWidget extends State<HomeScreen> {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _homeProvider.selecCategory(categoryName: 'Espresso');
    super.initState();
  }

  Widget categoriesList(HomeProvider homeProvider) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return GestureDetector(
            onTap: () => homeProvider.selecCategory(categoryName: category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: homeProvider.selectedCategory == category
                  ? Colors.blue
                  : Colors.transparent,
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: homeProvider.selectedCategory == category
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget productGridVIew(HomeProvider homeProvider) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: homeProvider
                .productsByCategory[homeProvider.selectedCategory]?.length ??
            0,
        itemBuilder: (context, index) {
          Product product = homeProvider
              .productsByCategory[homeProvider.selectedCategory]![index];
          return GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black.withOpacity(0.7),
              title: Text(product.title),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            ),
            child: Image.network(
              product.images,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
