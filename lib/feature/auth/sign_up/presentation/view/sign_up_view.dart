import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:best_price/feature/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:best_price/feature/auth/sign_up/presentation/widgets/build_auth_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
            child: SignUpForm(),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: SizedBox(
                width: 328.64.w,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'By creating an account, you agree to our\n',
                      style: AppStyles.textStyle14),
                  TextSpan(
                      text: 'Term & Conditions',
                      style: AppStyles.textStyle14
                          .copyWith(fontWeight: FontWeight.w700))
                ]))),
          ),
          SizedBox(
            height: 60.h,
          ),
          AppBottom(
            title: "Sign Up",
            onTap: () async {
              signUpCubit.signUp();
            },
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

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HelperFunctions.navigateToScreen(context, LoginView());
      },
      splashColor: Colors.white,
      hoverColor: Colors.white,
      child: SizedBox(
        height: 32.h,
        child: Text('Already have an account? Login',
            textAlign: TextAlign.center, style: AppStyles.textStyle16w400),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = SignUpCubit.get(context);
    return Form(
      key: signUpCubit.signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildAuthTextFields(signUpCubit),
      ),
    );
  }
}
