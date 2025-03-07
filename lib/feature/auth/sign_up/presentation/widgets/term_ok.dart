import 'package:best_price/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class TermOk extends StatelessWidget {
  const TermOk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: 'By creating an account, you agree to our\n',
              style: AppStyles.textStyle14),
          TextSpan(
              text: 'Term & Conditions',
              style:
                  AppStyles.textStyle14.copyWith(fontWeight: FontWeight.w700))
        ])));
  }
}
