import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBrandsItem extends StatelessWidget {
  const ShimmerBrandsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      width: 102.w,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: ShapeDecoration(
        color: AppColor.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
          highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
          child: const Center(child: Text("")),
        ),
      ),
    );
  }
}
