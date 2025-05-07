import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class StoreCard extends StatelessWidget {
  const StoreCard(
      {super.key, required this.storeName, required this.imageUrl, this.onTap});
  final String storeName, imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173.w,
      height: 173.w,
      decoration: ShapeDecoration(
        color: AppColor.containerBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                  height: 72.w,
                  width: 160.w,
                ),
              ),
              height: 72.w,
              width: 160.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              storeName,
              style: AppStyles.textStyle17w700
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
