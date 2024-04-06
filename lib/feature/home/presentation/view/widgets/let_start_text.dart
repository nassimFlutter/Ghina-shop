import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class LetStartText extends StatelessWidget {
  const LetStartText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Let’s start shopping!",
      style: AppStyles.textStyle17w700.copyWith(color: Colors.black),
    );
  }
}
