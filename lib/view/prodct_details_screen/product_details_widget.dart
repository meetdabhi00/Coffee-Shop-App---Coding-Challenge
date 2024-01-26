import 'package:coffee_shop_app_coding_challenge/data/dummy_data/dummy_data.dart';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/prodct_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

abstract class ProductDetailsWidget extends State<ProductDetailsScreen> {
  late Product productData;
  late HomeProvider homeProvider;
  @override
  void initState() {
    productData = widget.product;
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeProvider.selecProductSize(produtSize: produtSizes.first);
    });
    super.initState();
  }

  Widget productSize({required HomeProvider homeProvider}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: 25.sp,
            color: AppColor.titleColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: List.generate(
              produtSizes.length,
              (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      return homeProvider.selecProductSize(
                        produtSize: produtSizes[index],
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          color: homeProvider.selectedProductSize ==
                                  produtSizes[index].toString()
                              ? AppColor.lightMainColor
                              : Colors.transparent,
                          border: Border.all(
                            color: homeProvider.selectedProductSize ==
                                    produtSizes[index].toString()
                                ? AppColor.mainColors
                                : AppColor.subtitleColor,
                          ),
                        ),
                        child: Text(
                          produtSizes[index],
                          style: TextStyle(
                            color: homeProvider.selectedProductSize ==
                                    produtSizes[index].toString()
                                ? AppColor.mainColors
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomPriceButton({required Product productData}) {
    return Container(
      height: 130.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 30.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColor.subtitleColor,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                  ),
                  Text(
                    '\$ ${productData.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColor.mainColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 60.w, right: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.mainColors,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Buy Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
