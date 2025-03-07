import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:best_price/feature/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:best_price/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> buildAuthTextFields(context, SignUpCubit signUpCubit) {
  List<Widget> fields = [];
// todo : finish translate
  List<Map<String, dynamic>> fieldsData = [
    {
      "title": S.of(context).full_name_, //"Full Name*",
      "textEditingController": signUpCubit.fullNameController,
      "validator": (value) => Validate.validateFullName(context, value),
      "keyboardType": TextInputType.name,
    },
    {
      "title": S.of(context).email_, //"Email*",
      "textEditingController": signUpCubit.emailController,
      "validator": (value) => Validate.validateEmail(context, value),
      "keyboardType": TextInputType.emailAddress,
    },
    {
      "title": S.of(context).phone_number_, //"Phone Number*",
      "textEditingController": signUpCubit.phoneController,
      "validator": (value) => Validate.validatePhoneNumber(context, value),
      "keyboardType": TextInputType.phone,
    },
    {
      "title": S.of(context).password_, //"Password*",
      "textEditingController": signUpCubit.passwordController,
      "validator": (value) => Validate.validatePassword(context, value),
      "keyboardType": TextInputType.visiblePassword,
    },
    {
      "title": S.of(context).confirm_password_, //"Confirm Password*",
      "textEditingController": signUpCubit.confirmPasswordController,
      "validator": (value) => Validate.validateConfirmPassword(
          context, value, signUpCubit.passwordController.text),
      "keyboardType": TextInputType.visiblePassword,
    },
  ];
  for (var data in fieldsData) {
    fields.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthFieldText(title: data['title']!),
          SizedBox(height: 6.h),
          AuthTextField(
            textEditingController: data['textEditingController'],
            validator: data["validator"],
            hintText: S.of(context).Enter_Here,
            keyboardType: data['keyboardType'],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  return fields;
}
