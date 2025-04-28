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
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
// todo : finish translate
  @override
  Widget build(BuildContext context) {
    SendForgetPasswordCubit forgetPasswordCubit =
        SendForgetPasswordCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        forgetPasswordCubit.initState();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w, top: 4.h),
                child: Row(
                  children: [
                    AppBarBottom(
                      iconPath: IconsPath.arrowLeftIcon,
                      onTap: () {
                        forgetPasswordCubit.initState();
                        HelperFunctions.navigateToBack(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Center(
                child: Text(
                  S.of(context).forgot_password, // 'Forgot Password',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle24,
                ),
              ),
              // SizedBox(
              //   height: 14.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.w),
              //   child: Center(
              //     child: Text(
              //         S
              //             .of(context)
              //             .lorem_small, // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              //         textAlign: TextAlign.center,
              //         style: AppStyles.textStyle14),
              //   ),
              // ),
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
                    AuthFieldText(
                      title: S.of(context).e_mail, //"E-mail",
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Form(
                      key: forgetPasswordCubit.forgetPasswordFormKey,
                      child: AuthTextField(
                        validator: (p0) {
                          return Validate.validateEmail(context, p0);
                        },
                        textEditingController:
                            forgetPasswordCubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: S
                            .of(context)
                            .enter_your_email, //"Enter your email",
                      ),
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
                            title: S
                                .of(context)
                                .forgot_password, //"Forgot Password",
                            email: forgetPasswordCubit.emailController.text,
                            contain: S
                                .of(context)
                                .password_reset_link, //"A password reset link has \nbeen sent to your email",
                          ));
                    } else {
                      HelperFunctions.showCustomDialog(
                          context,
                          ForgetPasswordDialog(
                            title: S
                                .of(context)
                                .forgot_password, //"Forgot Password",
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
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                      child: AppBottom(
                        onTap: () {
                          forgetPasswordCubit.forgetPassword(
                              forgetPasswordCubit.emailController.text);
                        },
                        title: S.of(context).send, //"send",
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
