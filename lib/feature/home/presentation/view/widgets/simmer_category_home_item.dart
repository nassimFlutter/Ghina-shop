import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SimmerCategoryHomeItem extends StatelessWidget {
  const SimmerCategoryHomeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 128.w,
      clipBehavior: Clip.none,
      margin: EdgeInsetsDirectional.only(end: 20.w),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: AppColor.categoriesContainerTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48.w,
            height: 48.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Text(
              'xxxx',
              style:
                  AppStyles.textStyle14.copyWith(color: AppColor.greyOpacity),
            ),
          ),
        ],
      ),
    );
  }
}
