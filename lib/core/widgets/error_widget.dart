import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(IconsPath.errorIcon),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Error try again",
            style: AppStyles.textStyle20w700,
          ),
          InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                IconsPath.reloadIcon,
                height: 30.h,
                width: 30.h,
              ))
        ],
      ),
    );
  }
}
