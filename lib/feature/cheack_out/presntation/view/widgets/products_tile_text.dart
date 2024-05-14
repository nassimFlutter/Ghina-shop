import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class ProductsTileText extends StatelessWidget {
  const ProductsTileText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text, // "Item Name",
      style: AppStyles.textStyle16w400.copyWith(color: AppColor.greyText),
    );
  }
}
