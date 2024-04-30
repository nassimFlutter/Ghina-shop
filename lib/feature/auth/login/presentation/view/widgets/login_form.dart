import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/feature/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Form(
        key: loginCubit.loginFormKey,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthFieldText(title: "E-mail"),
              SizedBox(
                height: 10.h,
              ),
              AuthTextField(
                  textEditingController: loginCubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (p0) {
                    return Validate.validateEmail(context, p0);
                  },
                  hintText: "Enter your email"),
              SizedBox(
                height: 15.h,
              ),
              const AuthFieldText(title: "Password"),
              SizedBox(
                height: 10.h,
              ),
              AuthTextField(
                  textEditingController: loginCubit.passwordController,
                  validator: (p0) {
                    return Validate.validatePassword(context, p0);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Enter your password"),
            ],
          ),
        ));
  }
}
