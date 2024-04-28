import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/change_password_model/chnage_password_model.dart';
import 'package:best_price/feature/account/data/repo/chnage_password_repo/change_password_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  //! --------------- Var ---------------------------------------
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();
  Response changePasswordResponse = Response(status: false);
  //! --------------- End Var ---------------------------------------
  
//* -------------------- Functions -----------------------------------
void clearControllers() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
}
//* -------------------- End Functions -----------------------------------
  
//? ------------------- Apis -------------------------------------
  Future<void> changePassword() async {
    if (!changePassFormKey.currentState!.validate()) {
      return;
    }
    ChangePasswordModel changePassword = ChangePasswordModel(
        oldPassword: oldPasswordController.text,
        password: newPasswordController.text,
        confirmPassword: confirmPasswordController.text);
    emit(ForgetPasswordLoading());
    var result = await getIt
        .get<ChangePasswordRepo>()
        .changeMyPassword(changePassword.toJson());
    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      emit(ForgetPasswordFailures(errMessage: error.errMassage));
    }, (changed) {
      changePasswordResponse = changed;
      emit(ForgetPasswordSuccess());
    });
  }
//? ------------------- End Apis -------------------------------------
  
}
