import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdItem extends StatelessWidget {
  const AdItem({
    super.key,
  });

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
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 22.h, start: 24.w),
                child: Text(
                  "Lorem ipsum\ndolor",
                  style: AppStyles.textStyle20w700.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Noice Cancelling\n Wireless Headphone",
                style: AppStyles.textStyle12w700
                    .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ],
          ),
          Spacer(),
          SizedBox(width: 20.w),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 20.h),
            child: Image.asset(
              ImagePath.headphonesImage,
              width: 126.w,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
