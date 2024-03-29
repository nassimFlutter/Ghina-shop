import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TerminateAccountBottom extends StatelessWidget {
  const TerminateAccountBottom({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 361.w,
        height: 50.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColor.greyColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 11.w),
              child: Text(
                'Terminate Account',
                style: AppStyles.textStyle16w400.copyWith(color: AppColor.red),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 11.w),
              child: SvgPicture.asset(IconsPath.terminateIcon),
            )
          ],
        ),
      ),
    );
  }
}
