import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/view/home/widget/home_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  TextEditingController serachController = TextEditingController();
  late HomeProvider _homeProvider;
  @override
  void initState() {
    _homeProvider = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeProvider.searchProduct(text: '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          backgroundColor: AppColor.backGroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            titleSpacing: 0,
            title: searchFiled(context, homeProvider),
          ),
          body: homeProvider.searchProductList.isNotEmpty
              ? HomeCommonWidget().productGridVIew(
                  productList: homeProvider.searchProductList,
                  hero: false,
                )
              : const Center(child: Text('No Data Found')),
        );
      },
    );
  }

  Widget searchFiled(BuildContext context, HomeProvider homeProvider) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Container(
        height: 65.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff303030),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 2.w),
          child: Expanded(
            child: Row(
              children: [
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 15.w),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: serachController,
                    cursorColor: AppColor.white,
                    autofocus: true,
                    onChanged: (text) => homeProvider.searchProduct(text: text),
                    onTapOutside: (tap) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }
                    },
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.white,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Search coffee',
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF989898),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      currentFocus.focusedChild?.unfocus();
                    }
                    homeProvider.searchProduct(text: serachController.text);
                  },
                  child: SvgPicture.asset(
                    'assets/photos/svg/common_icon/search_normal.svg',
                  ),
                ),
                SizedBox(width: 30.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
