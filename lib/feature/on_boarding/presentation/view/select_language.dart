import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/selected_language.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 76.h),
              Text('Choose Language',
                  textAlign: TextAlign.center, style: AppStyles.textStyle24),
              SizedBox(height: 30.h),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle14),
              SizedBox(
                height: 77.h,
              ),
              const SelectedLanguage(
                title: "English",
                borderSide: BorderSide(width: 0, color: Colors.white),
                imagePath: IconsPath.kingdom,
              ),
              SizedBox(
                height: 34.h,
              ),
              const SelectedLanguage(
                  borderSide: BorderSide(color: AppColor.buddhaGold, width: 1),
                  imagePath: IconsPath.kuwait,
                  title: "العربية"),
            ],
          ),
        ),
      ),
    );
  }
}
