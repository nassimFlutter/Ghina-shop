import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeTitle extends StatelessWidget {
  const ShimmerHomeTitle({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? const Color(0xff0e0e0e),
      highlightColor: Colors.grey[100] ?? const Color(0xff0e0e0e),
      child: Row(
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
              style: AppStyles.textStyle14.copyWith(
                color: AppColor.titleTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}