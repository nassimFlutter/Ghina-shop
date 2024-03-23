import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/feature/on_boarding/presentation/widgets/selected_language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          const SelectedLanguage(
              visible: true,
              title: "english",
              imagePath: IconsPath.kingdom,
              borderSide: BorderSide(width: 1, color: Colors.white)),
          SizedBox(
            height: 15.h,
          ),
          const SelectedLanguage(
              visible: true,
              title: "العربية",
              imagePath: IconsPath.kuwait,
              borderSide: BorderSide(width: 1, color: AppColor.pirateGold)),
        ],
      ),
    );
  }
}
