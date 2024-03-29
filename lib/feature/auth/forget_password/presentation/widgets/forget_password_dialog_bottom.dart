import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordDialogBottom extends StatelessWidget {
  const ForgetPasswordDialogBottom({
    super.key,
    this.bottomColor = AppColor.buddhaGold,
  });
  final Color bottomColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 155.w,
        height: 40.h,
        decoration: ShapeDecoration(
          color: bottomColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.50.sp),
          ),
        ),
        child: Center(
          child: Text('OK',
              textAlign: TextAlign.center, style: AppStyles.textStyle17w700),
        ),
      ),
    );
  }
}
