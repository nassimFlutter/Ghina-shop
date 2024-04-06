import 'package:best_price/core/theme/app_style.dart';
import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/core/widgets/app_bar_bottom.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/auth/forget_password/presentation/manager/cubit/forget_password_cubit.dart';
import 'package:best_price/feature/auth/forget_password/presentation/widgets/forget_password_dialog.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    SendForgetPasswordCubit forgetPasswordCubit =
        SendForgetPasswordCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, top: 4.h),
              child: const Row(
                children: [
                  AppBarBottom(
                    iconPath: IconsPath.arrowLeftIcon,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: Text('Forgot Password',
                  textAlign: TextAlign.center, style: AppStyles.textStyle24),
            ),
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Center(
                child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle14),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Form(
                child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthFieldText(title: "E-mail"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: forgetPasswordCubit.forgetPasswordFormKey,
                    child: AuthTextField(
                        validator: Validate.validateEmail,
                        textEditingController:
                            forgetPasswordCubit.emailController,
                        hintText: "Enter your email"),
                  ),
                  SizedBox(
                    height: 190.h,
                  ),
                ],
              ),
            )),
            BlocConsumer<SendForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  if (state.state) {
                    HelperFunctions.showCustomDialog(
                        context,
                        ForgetPasswordDialog(
                          title: "Forgot Password",
                          email: forgetPasswordCubit.emailController.text,
                          contain:
                              "A password reset link has \nbeen sent to your email",
                        ));
                  } else {
                    HelperFunctions.showCustomDialog(
                        context,
                        ForgetPasswordDialog(
                          title: "Forgot Password",
                          email: forgetPasswordCubit.emailController.text,
                          contain: state.message,
                        ));
                  }
                }
              },
              builder: (context, state) {
                if (state is ForgetPasswordLoading) {
                  return const CustomCircularProgressIndicator();
                } else {
                  return Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                    child: AppBottom(
                        onTap: () {
                          forgetPasswordCubit.forgetPassword(
                              forgetPasswordCubit.emailController.text);
                        },
                        title: "send"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
