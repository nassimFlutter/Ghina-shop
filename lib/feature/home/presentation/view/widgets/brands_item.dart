import 'package:best_price/core/theme/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BrandsItem extends StatelessWidget {
  const BrandsItem({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
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
        padding: const EdgeInsets.all(
          12,
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
