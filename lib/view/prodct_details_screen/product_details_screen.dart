import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/utils/expandable_text.dart';
import 'package:coffee_shop_app_coding_challenge/view/prodct_details_screen/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ProductDetailsWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          backgroundColor: AppColor.backGroundColor,
          appBar: AppBar(
            backgroundColor: AppColor.backGroundColor,
            leading: InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Detail',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 30.w),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    homeProvider.addFavoriteProdctList(id: productData.id);
                  },
                  child: SvgPicture.asset(
                    productData.isFavorite
                        ? 'assets/photos/svg/common_icon/heart_like.svg'
                        : 'assets/photos/svg/common_icon/Heart.svg',
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: productData.id,
                    child: Container(
                      height: 300.h,
                      width: ScreenUtil().screenWidth,
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        image: DecorationImage(
                          image: NetworkImage(productData.images),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productData.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: AppColor.titleColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                              child: Text(
                                productData.subtitle,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColor.subtitleColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: SizedBox(
                                    height: 30.h,
                                    width: 30.w,
                                    child: SvgPicture.asset(
                                      'assets/photos/svg/common_icon/star.svg',
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                Text(
                                  productData.rating.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    color: AppColor.titleColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ' (${productData.ratingPerson.toString()})',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColor.subtitleColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 55.h,
                            width: 55.h,
                            decoration: BoxDecoration(
                              color: AppColor.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Image.asset(
                              'assets/photos/images/bean.png',
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Container(
                            height: 55.h,
                            width: 55.h,
                            decoration: BoxDecoration(
                              color: AppColor.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Image.asset(
                              'assets/photos/images/milk.png',
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColor.dividerColor,
                    thickness: 1,
                    height: 45.h,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColor.titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: ExpandableText(
                      text: productData.description,
                      max: 0.45,
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: AppColor.subtitleColor,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                  ),
                  productSize(homeProvider: homeProvider)
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomPriceButton(productData: productData),
        );
      },
    );
  }
}
