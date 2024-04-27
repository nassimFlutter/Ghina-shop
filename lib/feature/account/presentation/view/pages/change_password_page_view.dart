import 'package:best_price/core/utils/constants.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/core/widgets/app_bar_row.dart';
import 'package:best_price/core/widgets/app_bottom.dart';
import 'package:best_price/core/widgets/circular_progress_indicator.dart';
import 'package:best_price/feature/account/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:best_price/feature/account/presentation/view/widgets/susses_account_dialog.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit.get(context);
    return Scaffold(
      body: Form(
        key: forgetPasswordCubit.changePassFormKey,
        child: ListView(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          children: [
            SizedBox(
              height: 14.h,
            ),
            const AppBarRow(
                iconPath: IconsPath.arrowLeftIcon, title: 'Change Password'),
            SizedBox(
              height: 41.h,
            ),
            const AuthFieldText(title: "Old Password*"),
            SizedBox(
              height: 8.h,
            ),
            AuthTextField(
                validator: Validate.validatePassword,
                textEditingController:
                    forgetPasswordCubit.oldPasswordController,
                keyboardType: TextInputType.visiblePassword),
            SizedBox(
              height: 25.h,
            ),
            const AuthFieldText(title: "new Password*"),
            SizedBox(
              height: 8.h,
            ),
            AuthTextField(
                validator: Validate.validatePassword,
                textEditingController:
                    forgetPasswordCubit.newPasswordController,
                keyboardType: TextInputType.streetAddress),
            SizedBox(
              height: 25.h,
            ),
            const AuthFieldText(title: "Confirm Password*"),
            SizedBox(
              height: 8.h,
            ),
            AuthTextField(
                validator: (p0) {
                  return Validate.validateConfirmPassword(
                      p0, forgetPasswordCubit.newPasswordController.text);
                },
                textEditingController:
                    forgetPasswordCubit.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword),
            SizedBox(
              height: 348.h,
            ),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  HelperFunctions.showCustomDialog(
                      context,
                      const UpdateAccountDialog(
                        contain: "You have successfully\nChanged Your Password",
                        title: 'Change Password',
                      ));
                } else if (state is ForgetPasswordFailures) {
                  HelperFunctions.showCustomDialog(
                      context,
                      UpdateAccountDialog(
                        contain: state.errMessage,
                        title: 'Change Password Error',
                      ));
                }
              },
              builder: (context, state) {
                if (state is ForgetPasswordLoading) {
                  return const Center(
                    child: CustomCircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.only(end: 16.0.w, bottom: 64.h),
                    child: AppBottom(
                        onTap: () async {
                          forgetPasswordCubit.changePassword();
                        },
                        title: 'Change'),
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
