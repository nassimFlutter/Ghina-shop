import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAdList extends StatelessWidget {
  const ShimmerAdList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
        highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const HomeBannerShimmer();
          },
        ),
      ),
    );
  }
}

class HomeBannerShimmer extends StatelessWidget {
  const HomeBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 180.h,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: BoxDecoration(
          color: AppColor.corn, borderRadius: BorderRadius.circular(16.r)),
    );
  }
}
