import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 110.w, top: 20.h),
        child: Text(
          "Added to Wishlist",
          style: AppStyles.textStyle17w700,
        ),
      ),
    );
  }
}
