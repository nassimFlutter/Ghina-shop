import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductsItem extends StatelessWidget {
  const ShimmerProductsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
      highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsetsDirectional.only(start: Dimensions.dStartPadding.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      color: AppColor.greyOpacity,
                      borderRadius: BorderRadius.circular(16.r)),
                ),
                Text(
                  "",
                  maxLines: 1,
                  style: AppStyles.textStyle16w400.copyWith(
                      color: AppColor.redOpacity, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5.h),
                const Visibility(
                  visible: true,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '1200',
                      style: TextStyle(
                        color: AppColor.greyOpacity,
                        fontSize: 10,
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.lineThrough,
                        height: 0.24,
                      ),
                    ),
                    TextSpan(
                      text: "xxx",
                      style: TextStyle(
                        color: AppColor.greyOpacity,
                        fontSize: 10,
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.24,
                      ),
                    )
                  ])),
                ),
                SizedBox(height: 5.h),
                Text(
                  "xxxxx",
                  maxLines: 1,
                  style: AppStyles.textStyle14
                      .copyWith(color: AppColor.greyOpacity),
                ),
                Text(
                  "",
                  maxLines: 1,
                  style: AppStyles.textStyle14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
