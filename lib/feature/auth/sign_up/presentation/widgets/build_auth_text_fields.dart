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
      "validator": Validate.validateFullName,
      "keyboardType": TextInputType.name,
    },
    {
      "title": "Email*",
      "textEditingController": signUpCubit.emailController,
      "validator": Validate.validateEmail,
      "keyboardType": TextInputType.emailAddress,
    },
    {
      "title": "Phone Number*",
      "textEditingController": signUpCubit.phoneController,
      "validator": Validate.validatePhoneNumber,
      "keyboardType": TextInputType.phone,
    },
    {
      "title": "Password*",
      "textEditingController": signUpCubit.passwordController,
      "validator": Validate.validatePassword,
      "keyboardType": TextInputType.visiblePassword,
    },
    {
      "title": "Confirm Password*",
      "textEditingController": signUpCubit.confirmPasswordController,
      "validator": (value) => Validate.validateConfirmPassword(
          value, signUpCubit.passwordController.text),
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
            hintText: "Enter Here",
            keyboardType: data['keyboardType'],
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
