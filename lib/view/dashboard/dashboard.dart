import 'package:coffee_shop_app_coding_challenge/data/model/bottom_nav_item_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/dashboard/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          backgroundColor: AppColor.background,
          body: _screens[_selectedIndex],
          bottomNavigationBar: 1 == 1
              ? CustomBottomNavigationBar(
                  items: bottomNavItems,
                  selectedIndex: _selectedIndex,
                  onItemSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                )
              : BottomNavigationBar(
                  backgroundColor: Colors.amber,
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  items: [
                    bottomItem(
                      title: 'Home',
                      imagePath: 'assets/photos/svg/bottom_icons/home.svg',
                    ),
                    bottomItem(
                      title: 'Favorite',
                      imagePath: 'assets/photos/svg/bottom_icons/favorite.svg',
                    ),
                    bottomItem(
                      title: 'Cart',
                      imagePath: 'assets/photos/svg/bottom_icons/cart.svg',
                    ),
                    bottomItem(
                      title: 'Notifications',
                      imagePath:
                          'assets/photos/svg/bottom_icons/notification.svg',
                    ),
                  ],
                ),
        );
      },
    );
  }

  BottomNavigationBarItem bottomItem({
    required String title,
    required String imagePath,
  }) {
    return BottomNavigationBarItem(
      label: title,
      icon: SvgPicture.asset(imagePath),
      activeIcon: SvgPicture.asset(
        imagePath,
        colorFilter: ColorFilter.mode(AppColor.mainColors, BlendMode.srcIn),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
