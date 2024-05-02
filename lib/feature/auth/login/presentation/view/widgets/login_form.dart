import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/feature/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });
// todo : finish translate
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
              AuthFieldText(
                title: S.of(context).e_mail, // "E-mail",
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthTextField(
                textEditingController: loginCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (p0) {
                  return Validate.validateEmail(context, p0);
                },
                hintText: S.of(context).enter_your_email, //"Enter your email",
              ),
              SizedBox(
                height: 15.h,
              ),
              AuthFieldText(
                title: S.of(context).password, //"Password",
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthTextField(
                textEditingController: loginCubit.passwordController,
                validator: (p0) {
                  return Validate.validatePassword(context, p0);
                },
                keyboardType: TextInputType.visiblePassword,
                hintText:
                    S.of(context).enter_your_password, //"Enter your password",
              ),
            ],
          ),
        ));
  }
}
