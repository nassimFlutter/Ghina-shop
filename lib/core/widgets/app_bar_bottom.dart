import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarBottom extends StatelessWidget {
  final String iconPath;

  const AppBarBottom({
    super.key,
    required this.iconPath,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap ??
              () {
                Navigator.of(context).pop();
              },
          child: Container(
            width: 36.w,
            height: 36.w,
            padding: const EdgeInsets.all(9),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: AppColor.borderColor),
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
