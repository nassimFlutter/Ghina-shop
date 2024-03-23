import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validator,
  });
  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 385.w,
        margin: EdgeInsetsDirectional.only(end: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(width: 2, color: AppColor.failedBorderColor),
        ),
        child: TextFormField(
          controller: textEditingController,
          validator: validator,
          decoration: InputDecoration(
              errorStyle:
                  AppStyles.textStyle14.copyWith(color: Colors.red[400]),
                  
              contentPadding:
                  EdgeInsetsDirectional.only(start: 16.w, bottom: 8.h),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle:
                  AppStyles.textStyle14.copyWith(color: AppColor.silver)),
        ));
  }
}
