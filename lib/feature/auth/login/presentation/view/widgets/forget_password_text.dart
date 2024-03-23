import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              HelperFunctions.navigateToScreen(
                  context, const ForgetPasswordView());
            },
            child: Text('Forgot Password?',
                textAlign: TextAlign.right,
                style: AppStyles.textStyle14.copyWith(
                  color: AppColor.blueColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.blueColor,
                )),
          ),
        ],
      ),
    );
  }
}
