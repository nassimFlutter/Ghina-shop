import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class AuthFieldText extends StatelessWidget {
  const AuthFieldText({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: AppStyles.textStyle14.copyWith(
            color: AppColor.blackColorOpacity, fontWeight: FontWeight.w400));
  }
}
