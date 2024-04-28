import 'package:best_price/core/utils/validate.dart';
import 'package:best_price/feature/account/presentation/manager/edit_account_cubit/edit_account_cubit.dart';
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
    EditAccountCubit editAccountCubit = EditAccountCubit.get(context);
    return Form(
      key: editAccountCubit.editAccountFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthFieldText(title: "Full Name*"),
          SizedBox(
            height: 10.h,
          ),
          AuthTextField(
              textEditingController: editAccountCubit.nameController,
              validator: Validate.validateFailed,
              keyboardType: TextInputType.name,
              hintText: "Enter your name"),
          SizedBox(
            height: 30.h,
          ),
          const AuthFieldText(title: "Email* "),
          SizedBox(
            height: 10.h,
          ),
          AuthTextField(
              textEditingController: editAccountCubit.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: Validate.validateEmail,
              hintText: "Enter your E-mail"),
          SizedBox(
            height: 30.h,
          ),
          const AuthFieldText(title: "Mobile Number*"),
          SizedBox(
            height: 10.h,
          ),
          AuthTextField(
              textEditingController: editAccountCubit.phoneController,
              keyboardType: TextInputType.phone,
              validator: Validate.validatePhoneNumber,
              hintText: "Enter your phone"),
        ],
      ),
    );
  }
}
