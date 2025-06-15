import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HelperFunctions.navigateToScreen(context, const LoginView());
      },
      splashColor: Colors.white,
      hoverColor: Colors.white,
      child: SizedBox(
        height: 32.h,
        child: Text(
          S.of(context).Already_Have,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle16w400.copyWith(
            color: AppColor.buddhaGold,
          ),
        ),
      ),
    );
  }
}
