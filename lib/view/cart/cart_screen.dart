import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: Text('Upcoming'),
      ),
    );
  }
}
