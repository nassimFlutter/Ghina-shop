import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    super.key,
    required this.iconPath,
    required this.title,
  });
  final String iconPath, title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarBottom(iconPath: iconPath),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: AppStyles.textStyle20w700,
        )
      ],
    );
  }
}
