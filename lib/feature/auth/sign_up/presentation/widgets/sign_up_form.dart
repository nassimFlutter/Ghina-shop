import 'package:best_price/feature/auth/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:best_price/feature/auth/sign_up/presentation/widgets/build_auth_text_fields.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = SignUpCubit.get(context);
    return Form(
      key: signUpCubit.signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildAuthTextFields(signUpCubit),
      ),
    );
  }
}
