import 'package:best_price/feature/auth/shared/widgets/auth_field_text.dart';
import 'package:best_price/feature/auth/shared/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAccountForm extends StatelessWidget {
  const EditAccountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthFieldText(title: "Full Name*"),
          SizedBox(
            height: 10.h,
          ),
          AuthTextField(
              textEditingController: TextEditingController(),
              hintText: "Mohammed"),
          SizedBox(
            height: 30.h,
          ),
          const AuthFieldText(title: "Email* "),
          SizedBox(
            height: 10.h,
          ),
          AuthTextField(
              textEditingController: TextEditingController(),
              hintText: "Mohammed@gmail.com"),
          SizedBox(
            height: 30.h,
          ),
          const AuthFieldText(title: "Mobile Number*"),
          SizedBox(
            height: 10.h,
          ),
          AuthTextField(
              textEditingController: TextEditingController(),
              hintText: "98988888"),
        ],
      ),
    );
  }
}
