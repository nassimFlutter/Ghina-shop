import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

class AppBottom2 extends StatelessWidget {
  const AppBottom2({
    super.key,
    this.width = 171,
    this.height = 50,
    this.color = AppColor.corn,
    this.title,
  });
  // todo : finish translate
  final double width, height;
  final Color color;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      // padding: EdgeInsets.symmetric(horizontal: 56.w, vertical: 15.h),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999.sp),
        ),
      ),
      child: Center(
        child: Text(
          title ?? S.of(context).sign_in,
          style: AppStyles.textStyle17w700,
        ),
      ),
    );
  }
}
