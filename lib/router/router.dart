import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/view/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.dashBoard:
      return MaterialPageRoute(
        builder: (context) {
          return const DashBoard();
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
