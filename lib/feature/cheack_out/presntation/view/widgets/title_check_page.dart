import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class TitleCheckPage extends StatelessWidget {
  const TitleCheckPage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: AppStyles.textStyle18w400
            .copyWith(fontWeight: FontWeight.w700, color: AppColor.silver));
  }
}
