import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle textStyle12w700 = TextStyle(
    color: Colors.black,
    fontSize: 12.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
  );
  static TextStyle textStyle14 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle17w700 = TextStyle(
    color: Colors.white,
    fontSize: 17.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyle16w400 = TextStyle(
    color: AppColor.greyWithOpacity,
    fontSize: 16.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle18w700 = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
  );
  static TextStyle textStyle20w700 = TextStyle(
    color: Colors.black,
    fontSize: 20.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
  );
  static TextStyle textStyle24 = TextStyle(
    color: AppColor.blackColorOpacity,
    fontSize: 24.sp,
    fontFamily: 'Josefin Sans',
    fontWeight: FontWeight.w700,
    height: 0.06,
  );
  //! Decoration 🔳
  static ShapeDecoration accountContainerDecoration() {
    return ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF9F9F9F)),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
