import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle textStyle24 = TextStyle(
    color: AppColor.blackColorOpacity,
    fontSize: 24.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
    height: 0.06,
  );
  static TextStyle textStyle14 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w400,
    height: 0,
  );
  static TextStyle textStyle17 = TextStyle(
    color: Colors.white,
    fontSize: 17.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
  );
  static TextStyle textStyle16 = TextStyle(
    color: AppColor.greyWithOpacity,
    fontSize: 16.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w400,
    height: 0.09,
    letterSpacing: 0.16,
  );
}
