import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.textEditingController,
    this.hintText = "Enter Here",
    this.validator,
    this.minLine = 1,
    this.maxLine = 1,
    this.inputFormatters,
    required this.keyboardType,
  });
  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String?)? validator;
  final int minLine, maxLine;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 385.w,
        padding: EdgeInsets.only(bottom: 5.h),
        clipBehavior: Clip.none,
        margin: EdgeInsetsDirectional.only(end: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(width: 2, color: AppColor.failedBorderColor),
        ),
        child: TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          minLines: minLine,
          maxLines: maxLine,
          inputFormatters: inputFormatters,
          style: AppStyles.textStyle14.copyWith(color: AppColor.silver),
          keyboardType: keyboardType,
          controller: textEditingController,
          validator: validator,
          clipBehavior: Clip.none,
          decoration: InputDecoration(
              hintText: hintText,
              errorStyle:
                  AppStyles.textStyle14.copyWith(color: Colors.red[400]),
              contentPadding: EdgeInsetsDirectional.only(start: 16.w, top: 5.h),
              border: InputBorder.none,
              hintStyle:
                  AppStyles.textStyle14.copyWith(color: AppColor.silver)),
        ));
  }
}
