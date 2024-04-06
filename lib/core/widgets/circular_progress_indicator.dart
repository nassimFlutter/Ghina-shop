import 'package:best_price/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      size: 50,
      color: AppColor.buddhaGold,
    );
  }
}
