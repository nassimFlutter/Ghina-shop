import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplyBottom extends StatelessWidget {
  const ApplyBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101.w,
      height: 60.h,
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color(0xFFC58E03),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      child: Center(
        child: Text(
          "Apply",
          style: AppStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
