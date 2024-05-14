import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInPaymentDetailsContainer extends StatelessWidget {
  const TextInPaymentDetailsContainer({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 10.w),
          child: Text(
            title,
            style: AppStyles.textStyle16w700
                .copyWith(fontWeight: FontWeight.w400, color: AppColor.black3),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 10.w),
          child: Text(
            value,
            style: AppStyles.textStyle16w400.copyWith(color: AppColor.black3),
          ),
        ),
      ],
    );
  }
}
