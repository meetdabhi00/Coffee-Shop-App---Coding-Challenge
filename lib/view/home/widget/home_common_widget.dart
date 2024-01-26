import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeCommonWidget {
  Widget productGridVIew({
    required List<Product> productList,
    required bool hero,
  }) {
    return Expanded(
      child: GridView.builder(
        itemCount: productList.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 35.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 0.7 / 1,
        ),
        itemBuilder: (context, index) {
          Product product = productList[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePath.productDetailsScreen,
              arguments: product,
            ),
            child: ClipRRect(
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
                          hero
                              ? Hero(
                                  tag: product.id,
                                  child: imageView(product),
                                )
                              : imageView(product),
                          ratingBox(product),
                        ],
                      ),
                    ),
                    productDetails(product),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox imageView(Product product) {
    return SizedBox(
      height: 150.h,
      width: ScreenUtil().screenWidth,
      child: Image.network(
        product.images,
        fit: BoxFit.cover,
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
            Expanded(
              child: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.titleColor,
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: Text(
                product.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.subtitleColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.categoryTextColors,
                    ),
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
