import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/already_have_an_account_text.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/term_ok.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
//! note : the padding for list in zero each element  has a custom padding
  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = SignUpCubit.get(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, top: 4.h),
            child: const AppBarBottom(
              iconPath: IconsPath.arrowLeftIcon,
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: Text('Sign Up',
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
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
            child: const SignUpForm(),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: const TermOk(),
          ),
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppBottom(
              title: "Sign Up",
              onTap: () async {
                signUpCubit.signUp();
              },
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          const AlreadyHaveAnAccountText(),
          SizedBox(
            height: 26.h,
          ),
        ],
      ),
    );
  }
}
