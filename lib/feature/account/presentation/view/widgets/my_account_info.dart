import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountInfo extends StatelessWidget {
  const MyAccountInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.accountContainerDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 14.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Mohammed Al Simari",
              style: AppStyles.textStyle20w700,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Mohammed@gmail.com",
              style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              "+965 98888988",
              style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
