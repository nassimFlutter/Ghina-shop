import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBarWidget extends StatelessWidget {
  const CustomSnackBarWidget({
    super.key,
  });
// todo : finish translates
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.corn,
      child: SizedBox(
        height: 80.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 110.w, top: 20.h),
          child: Text(
            S.of(context).added_to_wishlist, // "Added to Wishlist",
            style: AppStyles.textStyle17w700,
          ),
        ),
      ),
    );
  }
}
