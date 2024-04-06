import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/view/widgets/susses_account_dialog.dart';
import 'package:best_price/feature/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:best_price/feature/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:best_price/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/app_bar_bottom.dart';
import '../../../../../../core/widgets/app_bottom.dart';
import '../widgets/forget_password_text.dart';
import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, top: 4.h),
              child: const Row(
                children: [
                  AppBarBottom(
                    iconPath: IconsPath.cancelIcon,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: Text('Login',
                  textAlign: TextAlign.center, style: AppStyles.textStyle24),
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                textAlign: TextAlign.center,
                style: AppStyles.textStyle14),
            SizedBox(
              height: 80.h,
            ),
            const LoginForm(),
            SizedBox(
              height: 20.h,
            ),
            const ForgetPasswordText(),
            SizedBox(
              height: 76.h,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  if (state.status) {
                    CacheHelper.setData(key: Keys.kIsFirstTime, value: true);
                    HelperFunctions.navigateToScreen(
                        context, const HomePageView());
                  } else {
                    HelperFunctions.showCustomDialog(
                        context,
                        UpdateAccountDialog(
                          title: "Sign up error",
                          contain: state.message,
                        ));
                  }
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CustomCircularProgressIndicator();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppBottom(
                      title: "LogIn",
                      onTap: () async {
                        loginCubit.logIn();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 270.h,
            ),
            GestureDetector(
              onTap: () {
                HelperFunctions.navigateToScreen(context, const SignUpView());
              },
              child: Text('Don’t have an account? Register',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle16w400),
            ),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }
}
