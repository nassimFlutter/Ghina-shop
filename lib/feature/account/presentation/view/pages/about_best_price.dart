import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/feature/account/data/fuck_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutBestPrice extends StatelessWidget {
  const AboutBestPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          ListView(padding: EdgeInsets.symmetric(horizontal: 16.w), children: [
        SizedBox(
          height: 14.h,
        ),
        const AppBarRow(
            iconPath: IconsPath.arrowLeftIcon, title: "About Best Price"),
        SizedBox(
          height: 26.h,
        ),
        Text(
          FuckData.termText,
          style: AppStyles.textStyle16w400
              .copyWith(color: Colors.black, height: 2),
        )
      ]),
    );
  }
}
