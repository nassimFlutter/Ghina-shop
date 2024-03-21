import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/on_boarding/presentation/view/select_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipBottom extends StatelessWidget {
  const SkipBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: HelperFunctions.getScreenHight(context) * 0.03,
      right: HelperFunctions.getScreenWidth(context) * 0.06,
      child: GestureDetector(
        onTap: () {
          HelperFunctions.navigateToScreen(context, const SelectLanguage());
        },
        child: Container(
          width: 160.w,
          height: 50.h,
          // padding: const EdgeInsets.symmetric(vertical: 15),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColor.buddhaGold,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Center(
            child: Text(
              'Skip',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Josefin Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
