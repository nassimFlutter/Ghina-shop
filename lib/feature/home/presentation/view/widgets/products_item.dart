import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(ImagePath.iphoneImage),
            Positioned(
              bottom: 15.h,
              right: 6.w,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: ShapeDecoration(
                  color: AppColor.yalow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                    child: SvgPicture.asset(
                  IconsPath.heartIcon,
                  fit: BoxFit.cover,
                )),
              ),
            )
          ],
        ),
        Padding(
          padding:
              EdgeInsetsDirectional.only(start: Dimensions.dStartPadding.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '150.000 KD',
                style: AppStyles.textStyle16w400.copyWith(
                    color: AppColor.redOpacity, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5.h),
              const Text.rich(TextSpan(children: [
                TextSpan(
                  text: '180.000 KD',
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
                  text: ' (10%)',
                  style: TextStyle(
                    color: AppColor.greyOpacity,
                    fontSize: 10,
                    fontFamily: 'Josefin Sans',
                    fontWeight: FontWeight.w700,
                    height: 0.24,
                  ),
                )
              ])),
              SizedBox(height: 5.h),
              Text(
                "iPhone 14 Pro Max",
                style:
                    AppStyles.textStyle14.copyWith(color: AppColor.greyOpacity),
              ),
              Text(
                "Brand Name\nCompany Name",
                style: AppStyles.textStyle14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
