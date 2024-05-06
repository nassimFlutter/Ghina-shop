import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.trailing,
    required this.title,
    required this.iconPath,
    this.onTap,
  });
  final Widget trailing;
  final String title, iconPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 18.w,
          top: 0.h,
          bottom: 20.h,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 11.w), // Adjust the width as needed
            Expanded(
              child: Text(
                title,
                style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
              ),
            ),
            trailing
          ],
        ),
      ),
    );
  }
}
// ListTile(
//         onTap: onTap,
//         contentPadding: EdgeInsetsDirectional.only(
//             bottom: 0.h, start: 16.w, end: 18.w, top: 0.h),
//         minVerticalPadding: 0,
//         leading: SvgPicture.asset(
//           iconPath,
//           width: 24.w,
//           height: 24.h,
//           fit: BoxFit.cover,
//         ),
//         title: Text(
//           title,
//           style: AppStyles.textStyle16w400.copyWith(color: Colors.black),
//         ),
//         trailing: trailing);