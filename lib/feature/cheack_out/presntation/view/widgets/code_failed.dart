import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/cheack_out/presntation/view/widgets/apply_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeFailed extends StatelessWidget {
  const CodeFailed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
        style: AppStyles.textStyle14.copyWith(color: AppColor.black),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsetsDirectional.only(bottom: 2, start: 16),
          labelText: "Enter Here",
          labelStyle: AppStyles.textStyle14.copyWith(color: AppColor.silver),
          suffixIcon: const ApplyBottom(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColor.failedBorderColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColor.failedBorderColor, width: 2),
          ),
        ),
      ),
    );
  }
}
