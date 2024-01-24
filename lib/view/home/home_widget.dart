import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop_app_coding_challenge/data/dummy_data/dummy_data.dart';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Bilzen, Tanjungbalai",
                style: TextStyle(
                  fontSize: 22.sp,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
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
    return Container(
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
    );
  }

  Widget sliderImage() {
    return Positioned(
      top: 200.h,
      child: Container(
        height: 200.h,
        width: ScreenUtil().screenWidth,
        color: Colors.transparent,
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
    );
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

  Widget productGridVIew(HomeProvider homeProvider) {
    String category = homeProvider.selectedCategory;
    List<Product> productList = homeProvider.productsByCategory[category] ?? [];
    return Expanded(
      child: GridView.builder(
        itemCount: productList.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 35.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.70 / 1,
        ),
        itemBuilder: (context, index) {
          Product product = productList[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 150.h,
                          width: ScreenUtil().screenWidth,
                          child: Image.network(
                            product.images,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ratingBox(product),
                      ],
                    ),
                  ),
                  productDetails(product),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget productDetails(Product product) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.titleColor,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              product.subtitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.subtitleColor,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.categoryTextColors,
                  ),
                ),
                Container(
                  height: 45.h,
                  width: 45.h,
                  decoration: BoxDecoration(
                    color: AppColor.mainColors,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: SvgPicture.asset(
                      'assets/photos/svg/common_icon/add.svg',
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingBox(Product product) {
    return Positioned(
      child: Container(
        height: 35.h,
        width: 80.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.16),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.r),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: SizedBox(
                height: 18.h,
                width: 18.w,
                child: SvgPicture.asset(
                  'assets/photos/svg/common_icon/star.svg',
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
              child: Text(
                product.rating.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
