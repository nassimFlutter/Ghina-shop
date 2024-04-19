import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/auth/forget_password/data/forget_password_repo/forget_password_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class SendForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  SendForgetPasswordCubit() : super(ForgetPasswordInitial());
  TextEditingController emailController = TextEditingController();
  static SendForgetPasswordCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  void initState() {
    emailController.clear();
    emit(ForgetPasswordInitial());
  }

  Future<void> forgetPassword(String email) async {
    if (!forgetPasswordFormKey.currentState!.validate()) {
      return;
    }

    emit(ForgetPasswordLoading());

    Either<Failure, Tuple2<bool, String>> result = await getIt
        .get<ForgetPasswordRepo>()
        .generateForgetPasswordToken(email);
    result.fold((error) {
      emit(ForgetPasswordFailure(errMessage: error.errMassage));
    }, (send) {
      emit(ForgetPasswordSuccess(state: send.value1, message: send.value2));
    });
  }
}
