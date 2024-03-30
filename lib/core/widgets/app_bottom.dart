import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ! you can change in argument ...
class AppBottom extends StatelessWidget {
  const AppBottom({
    super.key,
    this.onTap,
    required this.title,
    this.height = 50,
    // this.width = 361,
  });
  final void Function()? onTap;
  final String title;
  final double height; //, width;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.buddhaGold,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          // width: width.w,
          height: height.h,
          // clipBehavior: Clip.antiAlias,
          // decoration: ShapeDecoration(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(
          //       8,
          //     ),
          //   ),
          // ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle17w700,
            ),
          ),
        ),
      ),
    );
  }
}
