import 'package:coffee_shop_app_coding_challenge/data/model/bottom_nav_item_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/common_provider.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/cart/cart_screen.dart';
import 'package:coffee_shop_app_coding_challenge/view/dashboard/bottom_navigation_bar.dart';
import 'package:coffee_shop_app_coding_challenge/view/favorite/favorite_product_list_screen.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/home_screen/home_screen.dart';
import 'package:coffee_shop_app_coding_challenge/view/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoriteProductList(),
    const CartScreen(),
    const NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, CommonProvider>(
      builder: (context, homeProvider, commonProvider, child) {
        return Scaffold(
          backgroundColor: AppColor.backGroundColor,
          body: _screens[commonProvider.selectedIndex],
          bottomNavigationBar: CustomBottomNavigationBar(
            items: bottomNavItems,
            selectedIndex: commonProvider.selectedIndex,
            onItemSelected: (index) {
              commonProvider.bottomNavigationIndexChange(index: index);
            },
          ),
        );
      },
    );
  }

  List<BottomNavItem> bottomNavItems = [
    BottomNavItem(
      title: 'Home',
      imagePath: 'assets/photos/svg/bottom_icons/home.svg',
    ),
    BottomNavItem(
      title: 'Favorite',
      imagePath: 'assets/photos/svg/bottom_icons/favorite.svg',
    ),
    BottomNavItem(
      title: 'Cart',
      imagePath: 'assets/photos/svg/bottom_icons/cart.svg',
    ),
    BottomNavItem(
      title: 'Notifications',
      imagePath: 'assets/photos/svg/bottom_icons/notification.svg',
    ),
  ];
}
