import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    super.key,
    this.iconPath = IconsPath.arrowLeftIcon,
    required this.title,
    this.secondIconPath,
    this.thirdIconPath,
    this.onSecondIconTap,
    this.onThirdIconTap,
    this.onFirstIconTap,
  });
  final String iconPath, title;
  final String? secondIconPath;
  final String? thirdIconPath;
  final void Function()? onFirstIconTap;
  final void Function()? onSecondIconTap;
  final void Function()? onThirdIconTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          AppBarBottom(iconPath: iconPath, onTap: onFirstIconTap),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: AppStyles.textStyle20w700,
          ),
          if (secondIconPath != null)
            AppBarBottom(
              iconPath: secondIconPath!,
              onTap: onSecondIconTap,
            ),
          SizedBox(
            width: 10.w,
          ),
          if (thirdIconPath != null)
            AppBarBottom(
              iconPath: thirdIconPath!,
              onTap: onThirdIconTap,
            ),
        ],
      ),
    );
  }
}
