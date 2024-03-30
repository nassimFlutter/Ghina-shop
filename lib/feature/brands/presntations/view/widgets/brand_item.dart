import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
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
          child: SvgPicture.asset(
            imageUrl,
            clipBehavior: Clip.none,
          ),
        ),
      ),
    );
  }
}
