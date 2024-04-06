import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryHomeItem extends StatelessWidget {
  const CategoryHomeItem({
    super.key,
    required this.imageUrl,
    required this.categoryTitle,
  });
  final String imageUrl, categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
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
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
          ),
          // SvgPicture.asset(
          //   imageUrl,
          //   fit: BoxFit.cover,
          //   clipBehavior: Clip.none,
          // ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            categoryTitle,
            style: AppStyles.textStyle14.copyWith(color: AppColor.greyOpacity),
          )
        ],
      ),
    );
  }
}
