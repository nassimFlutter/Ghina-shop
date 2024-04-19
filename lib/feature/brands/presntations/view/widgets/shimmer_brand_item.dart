import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBrandItem extends StatelessWidget {
  const ShimmerBrandItem({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171.58.w,
      height: 102.61.h,
      decoration: ShapeDecoration(
        color: AppColor.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              period: const Duration(milliseconds: 1000),
              child: Container(
                  color: Colors.grey[300], // Adjust container color
                  child: SizedBox(
                    width: 171.58.w,
                    height: 102.61.h,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
