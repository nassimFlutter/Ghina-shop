import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerTextCheckout extends StatelessWidget {
  const ContainerTextCheckout({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.w),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: AppStyles.textStyle16w400.copyWith(
          color: AppColor.black,
        ),
      ),
    );
  }
}
