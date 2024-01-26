import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/view/dashboard/dashboard.dart';
import 'package:coffee_shop_app_coding_challenge/view/prodct_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.dashBoard:
      return MaterialPageRoute(
        builder: (context) {
          return const DashBoard();
        },
      );
    case RoutePath.productDetailsScreen:
      return MaterialPageRoute(
        builder: (context) {
          return ProductDetailsScreen(product: settings.arguments as Product);
        },
      );
    default:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container();
        },
      );
  }
}
