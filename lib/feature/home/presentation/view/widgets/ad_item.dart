import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdItem extends StatelessWidget {
  const AdItem({
    super.key,
    required this.banner,
  });
  final HomeBanner? banner;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 180.h,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: BoxDecoration(
          color: AppColor.corn, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 22.h, start: 24.w),
                child: Text(
                  banner?.title ?? "No title",
                  style: AppStyles.textStyle20w700.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: Text(
                  banner?.details ?? "No details",
                  style: AppStyles.textStyle12w700.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(width: 20.w),
          Padding(
              padding: EdgeInsetsDirectional.only(top: 20.h),
              child: CachedNetworkImage(
                width: 126.w,
                fit: BoxFit.cover,
                imageUrl: banner?.image ?? "",
              ))
        ],
      ),
    );
  }
}
