import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Notification',
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
