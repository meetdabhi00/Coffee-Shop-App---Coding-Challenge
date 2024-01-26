import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/common_provider.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/favorite/favorite_product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

abstract class FavoriteProductWidget extends State<FavoriteProductList> {
  Widget productView(HomeProvider homeProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: homeProvider.favoriteProductList.length,
        itemBuilder: (context, index) {
          Product product = homeProvider.favoriteProductList[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              RoutePath.productDetailsScreen,
              arguments: product,
            ),
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
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: SizedBox(
                          height: 150.h,
                          width: ScreenUtil().screenWidth,
                          child: Image.network(
                            product.images,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.w, top: 15.h),
                          child: InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              homeProvider.addFavoriteProdctList(
                                  id: product.id);
                            },
                            child: SvgPicture.asset(
                              product.isFavorite
                                  ? 'assets/photos/svg/common_icon/heart_like.svg'
                                  : 'assets/photos/svg/common_icon/Heart.svg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.h),
                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.titleColor,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        product.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.subtitleColor,
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget noDataFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You haven\'t added any \nproducts yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.titleColor,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Click 💓 to save products',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.titleColor,
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () => Provider.of<CommonProvider>(context, listen: false)
                .bottomNavigationIndexChange(index: 0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.mainColors,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: Text(
                  'Find items to save',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
