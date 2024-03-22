import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:best_price/feature/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> buildAuthTextFields(SignUpCubit signUpCubit) {
  List<Widget> fields = [];

  List<Map<String, dynamic>> fieldsData = [
    {
      "title": "Full Name*",
      "textEditingController": signUpCubit.fullNameController,
      "validator": Validate.validateFullName
    },
    {
      "title": "Email*",
      "textEditingController": signUpCubit.emailController,
      "validator": Validate.validateEmail
    },
    {
      "title": "Phone Number*",
      "textEditingController": signUpCubit.phoneController,
      "validator": Validate.validatePhoneNumber
    },
    {
      "title": "Password*",
      "textEditingController": signUpCubit.passwordController,
      "validator": Validate.validatePassword
    },
    {
      "title": "Confirm Password*",
      "textEditingController": signUpCubit.confirmPasswordController,
      "validator": (value) => Validate.validateConfirmPassword(
          value, signUpCubit.passwordController.text),
    },
  ];
  for (var data in fieldsData) {
    fields.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthFieldText(title: data['title']!),
          SizedBox(height: 20.h),
          AuthTextField(
            textEditingController: data['textEditingController'],
            validator: data["validator"],
            hintText: "Enter Here",
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }

  return fields;
}
