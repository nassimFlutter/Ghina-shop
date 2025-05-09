import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.title,
    this.onTap,
  });
  // todo : finish translate
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle20w700
              .copyWith(color: AppColor.homeTitleTextColor),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
            child: Opacity(
              opacity: 0.5,
              child: Text(
                S.of(context).see_all, //"See All",
                style: AppStyles.textStyle14
                    .copyWith(color: AppColor.titleTextColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
