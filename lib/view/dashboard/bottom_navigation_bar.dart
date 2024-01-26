import 'package:coffee_shop_app_coding_challenge/data/model/bottom_nav_item_model.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          items.length,
          (index) => BottomNavItemWidget(
            item: items[index],
            isSelected: index == selectedIndex,
            onTap: () => onItemSelected(index),
          ),
        ),
      ),
    );
  }
}

class BottomNavItemWidget extends StatelessWidget {
  final BottomNavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 100.w,
          padding: EdgeInsets.all(8.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                height: 25.h,
                width: 25.w,
                item.imagePath,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColor.mainColors : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              if (isSelected) const SizedBox(height: 5),
              if (isSelected)
                Container(
                  height: 5.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: AppColor.gradientMainColors,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
