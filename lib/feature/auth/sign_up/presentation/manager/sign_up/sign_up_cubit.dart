import 'dart:developer';

import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:best_price/feature/auth/sign_up/data/signup_repo/signup_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      LoggerHelper.debug("there is an validate error");
      return;
    }
    emit(SignUpLoading());
    UserModel newUser = UserModel(
        name: fullNameController.text.trim(),
        email: emailController.text.trim(),
        mobile: phoneController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim());

    LoggerHelper.debug(newUser.toString());
    var result = await getIt.get<SignUprRepo>().signUp(newUser);
    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      emit(SignUpFailure(errMessage: error.errMassage));
    }, (success) {
      emit(SignUpSuccess(
          statueMessage: success.value1, message: success.value2));
    });
  }
}
