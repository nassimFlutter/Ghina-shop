import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });
  final String title, imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 173.w,
        height: 173.w,
        decoration: ShapeDecoration(
          color: AppColor.greyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 42.w,
                width: 42.w,
              ),
              SizedBox(
                height: 37.h,
              ),
              Text(
                title,
                style: AppStyles.textStyle17w700
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              )
            ]),
      ),
    );
  }
}
