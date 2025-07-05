import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyAccountInfoShimmer extends StatelessWidget {
  const MyAccountInfoShimmer({super.key});
  Widget _shimmerLine({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.accountContainerDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 14.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            _shimmerLine(width: 150.w, height: 20.h),
            SizedBox(height: 5.h),
            _shimmerLine(width: 200.w, height: 16.h),
            SizedBox(height: 7.h),
            _shimmerLine(width: 180.w, height: 16.h),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
