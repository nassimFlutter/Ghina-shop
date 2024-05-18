import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidgetLeft extends StatelessWidget {
  const InfoWidgetLeft({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle18w700.copyWith(color: AppColor.silver),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(value, style: AppStyles.textStyle16w400),
      ],
    );
  }
}
