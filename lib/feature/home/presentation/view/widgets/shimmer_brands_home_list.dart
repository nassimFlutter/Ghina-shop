import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBrandsHomeList extends StatelessWidget {
  const ShimmerBrandsHomeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ShimmerBrandsItem();
        },
      ),
    );
  }
}

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
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
