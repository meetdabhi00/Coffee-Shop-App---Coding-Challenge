import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/home_screen/home_widget.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/widget/home_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 340.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff131313), Color(0xff303030)],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 80.r, left: 30.r, right: 30.r, bottom: 30.r),
                      child: Column(
                        children: [
                          topAppBar(),
                          serachFiled(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  categoriesList(homeProvider),
                  HomeCommonWidget().productGridVIew(
                    hero: true,
                    productList: homeProvider.productsByCategory[
                            homeProvider.selectedCategory] ??
                        [],
                  ),
                ],
              ),
              sliderImage(),
            ],
          );
        },
      ),
    );
  }
}
