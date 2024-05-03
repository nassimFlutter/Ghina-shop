import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/selected_language.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 76.h),
              Text(S.of(context).choose_language, //'Choose Language',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle24),
              SizedBox(height: 30.h),
              Text(
                  S
                      .of(context)
                      .lorem_small, // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle14),
              SizedBox(
                height: 77.h,
              ),
              SelectedLanguage(
                onTap: () {
                  HelperFunctions.navigateToScreen(context, const LoginView());
                },
                title: "English",
                borderSide: const BorderSide(width: 0, color: Colors.white),
                imagePath: IconsPath.kingdom,
              ),
              SizedBox(
                height: 34.h,
              ),
              SelectedLanguage(
                  onTap: () {
                    if (CacheHelper.getData(key: Keys.kUserToken) != null) {
                      HelperFunctions.navigateToScreen(
                          context, const HomePageView());
                    } else {
                      HelperFunctions.navigateToScreen(
                          context, const LoginView());
                    }
                  },
                  borderSide:
                      const BorderSide(color: AppColor.buddhaGold, width: 1),
                  imagePath: IconsPath.kuwait,
                  title: "العربية"),
            ],
          ),
        ),
      ),
    );
  }
}
