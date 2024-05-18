import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidgetRight extends StatelessWidget {
  const InfoWidgetRight({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: AppStyles.textStyle18w700.copyWith(color: AppColor.silver),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(value, style: AppStyles.textStyle16w400)
      ],
    );
  }
}
