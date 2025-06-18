import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/logger.dart';
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
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap ??
            () {
              Navigator.of(context).pop();
            },
        child: Container(
          width: 40.w,
          height: 40.h,
          padding: const EdgeInsets.all(9),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColor.borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              colorFilter:
                  const ColorFilter.mode(AppColor.buddhaGold, BlendMode.srcIn),
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
