import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/feature/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:best_price/feature/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:flutter/material.dart';
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, top: 4.h),
            child: const AppBarBottom(
              iconPath: IconsPath.cancelIcon,
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
          AppBottom(
            title: "Sign In",
            onTap: () async {
              loginCubit.logIn();
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
                textAlign: TextAlign.center, style: AppStyles.textStyle16),
          ),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}
