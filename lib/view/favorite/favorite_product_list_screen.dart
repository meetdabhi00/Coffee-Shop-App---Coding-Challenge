import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/favorite/favorite_product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoriteProductList extends StatefulWidget {
  const FavoriteProductList({super.key});

  @override
  State<FavoriteProductList> createState() => _FavoriteProductListState();
}

class _FavoriteProductListState extends FavoriteProductWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite Product',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return homeProvider.favoriteProductList.isNotEmpty
              ? productView(homeProvider)
              : noDataFound(context);
        },
      ),
    );
  }
}
