import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.textEditingController,
    this.hintText,
    this.validator,
    this.minLine = 1,
    this.maxLine = 1,
    this.inputFormatters,
    required this.keyboardType,
    this.maxLength,
  }) : super(key: key);
// todo : finish translate
  final TextEditingController textEditingController;
  final String? hintText;
  final String? Function(String?)? validator;
  final int minLine, maxLine;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        minLines: minLine,
        maxLength: maxLength,
        maxLines: maxLine,
        inputFormatters: inputFormatters,
        style: AppStyles.textStyle14.copyWith(color: AppColor.silver),
        keyboardType: keyboardType,
        controller: textEditingController,
        validator: validator,
        clipBehavior: Clip.none,
        decoration: InputDecoration(
          hintText: hintText ?? S.of(context).enter_here,
          errorStyle: AppStyles.textStyle14.copyWith(color: Colors.red[400]),
          // contentPadding: EdgeInsetsDirectional.only(start: 16.w, top: 6.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:
                const BorderSide(width: 2, color: AppColor.failedBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:
                const BorderSide(width: 2, color: AppColor.failedBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.sp),
            borderSide:
                const BorderSide(width: 2, color: AppColor.failedBorderColor),
          ),
          hintStyle: AppStyles.textStyle14.copyWith(color: AppColor.silver),
        ),
      ),
    );
  }
}
