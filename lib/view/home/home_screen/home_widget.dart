import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop_app_coding_challenge/data/dummy_data/dummy_data.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class HomeWidget extends State<HomeScreen> {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeProvider.selecCategory(categoryName: 'Espresso');
    });
    super.initState();
  }

  Widget topAppBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.subtitleColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Bilzen, Tanjungbalai",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: AppColor.white)
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
            ),
            child: Image.network(
              "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Free-Image.png",
              width: 44,
              height: 44,
            ),
          )
        ],
      ),
    );
  }

  Widget serachFiled() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutePath.productSearchScreen),
      child: Container(
        height: 65.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff303030),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/photos/svg/common_icon/search_normal.svg',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: const Text(
                      "Search coffee",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF989898),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 65.h,
                margin: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.mainColors,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/photos/svg/common_icon/furnitur_icon.svg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sliderImage() {
    return Positioned(
      top: 240.h,
      child: Container(
        height: 200.h,
        width: ScreenUtil().screenWidth,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => whatsapp(),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              // aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: List.generate(
              5,
              (index) => Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/photos/images/slider_1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  whatsapp() async {
    var contact = "916352836821";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      debugPrint('WhatsApp is not installed. $e');
    }
  }

  Widget categoriesList(HomeProvider homeProvider) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return GestureDetector(
            onTap: () => homeProvider.selecCategory(categoryName: category),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              margin: EdgeInsets.only(right: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: homeProvider.selectedCategory == category
                    ? AppColor.mainColors
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: homeProvider.selectedCategory == category
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: homeProvider.selectedCategory == category
                        ? Colors.white
                        : AppColor.categoryTextColors,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
