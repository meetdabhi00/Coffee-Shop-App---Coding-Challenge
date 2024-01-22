import 'package:flutter/material.dart';
import 'package:formet/router/route_path.dart';
import 'package:formet/view/dashboard/dashboard.dart';

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
