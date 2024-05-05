import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:best_price/feature/splash/presentation/manager/lang_cubit/lang_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: BlocConsumer<LangCubit, LangState>(
            listener: (context, state) {
              if (state is FirstChooseLangScreenState) {
                CacheHelper.setData(key: Keys.kIsFirstTime, value: false);
                HelperFunctions.navigateToScreenAndRemove(
                  context,
                  const LoginView(),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 76.h),
                  Text(S.of(context).choose_language, //'Choose Language',
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle24),
                  SizedBox(height: 9.h),
                  Text(
                      S
                          .of(context)
                          .lorem_small, // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle14),
                  SizedBox(
                    height: 45.h,
                  ),
                  SelectedLanguage(
                    onTap: () {
                      // HelperFunctions.navigateToScreen(
                      //     context, const LoginView());
                      BlocProvider.of<LangCubit>(context)
                          .firstChooseLang(language: "en");
                    },
                    title: "English",
                    borderSide: BorderSide(
                      width: BlocProvider.of<LangCubit>(context).lang == "en"
                          ? 1
                          : 0,
                      color: BlocProvider.of<LangCubit>(context).lang == "en"
                          ? AppColor.buddhaGold
                          : Colors.white,
                    ),
                    imagePath: IconsPath.kingdom,
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  SelectedLanguage(
                    onTap: () {
                      // if (CacheHelper.getData(key: Keys.kUserToken) != null) {
                      //   HelperFunctions.navigateToScreen(
                      //       context, const HomePageView());
                      // } else {
                      //   HelperFunctions.navigateToScreen(
                      //       context, const LoginView());
                      // }

                      BlocProvider.of<LangCubit>(context)
                          .firstChooseLang(language: "ar");
                    },
                    borderSide: BorderSide(
                      width: BlocProvider.of<LangCubit>(context).lang == "ar"
                          ? 1
                          : 0,
                      color: BlocProvider.of<LangCubit>(context).lang == "ar"
                          ? AppColor.buddhaGold
                          : Colors.white,
                    ),
                    imagePath: IconsPath.kuwait,
                    title: "العربية",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
