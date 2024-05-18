import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/auth/login/data/login_repo/login_repo.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  //! ----------------- Var -----------------
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //! --------------------- Apis ---------------------------
  Future<void> logIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoading());
    UserModel loginUser = UserModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    var result = await getIt.get<LoginRepo>().login(loginUser);
    result.fold((error) {
      emit(LoginFailure(errMessage: error.errMassage));
    }, (login) {
      CacheHelper.setData(key: Keys.kIsGuest, value: false);
      emit(LoginSuccess(status: login.value1, message: login.value2));
    });
  }
}
