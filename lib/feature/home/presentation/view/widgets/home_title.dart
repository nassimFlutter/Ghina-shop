import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle20w700,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See All",
            style:
                AppStyles.textStyle14.copyWith(color: AppColor.titleTextColor),
          ),
        ),
      ],
    );
  }
}
