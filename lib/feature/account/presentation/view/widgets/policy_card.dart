import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyCard extends StatelessWidget {
  const PolicyCard({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.index,
  });
  final String title;
  final int selectedIndex, index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.w,
      height: 50.h,
      margin: EdgeInsetsDirectional.only(end: 7.w),
      decoration: ShapeDecoration(
        color: selectedIndex == index ? const Color(0xFFB17303) : Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFB17303)),
          borderRadius: BorderRadius.circular(49),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: AppStyles.textStyle16w400.copyWith(
            color: selectedIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
