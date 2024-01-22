import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 350.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff131313), Color(0xff303030)],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(30.r),
                child: Column(
                  children: [
                    Row(
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
                    SizedBox(height: 32.h),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xff303030),
                          ),
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
