import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'edit_account_state.dart';

class EditAccountCubit extends Cubit<EditAccountState> {
  EditAccountCubit() : super(EditAccountInitial());
  static EditAccountCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> editAccountFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Future<void> updateCached() async {
    await CacheHelper.setData(key: Keys.kUserName, value: nameController.text);
    await CacheHelper.setData(
        key: Keys.kUserEmail, value: emailController.text);
    await CacheHelper.setData(
        key: Keys.kUserMobile, value: phoneController.text);
  }

  Future<void> initTextController() async {
    nameController.text = await CacheHelper.getData(key: Keys.kUserName);
    emailController.text = await CacheHelper.getData(key: Keys.kUserEmail);
    phoneController.text = await CacheHelper.getData(key: Keys.kUserMobile);
  }

  Future<void> updateUserAccount() async {
    if (!editAccountFormKey.currentState!.validate()) {
      return;
    }
    emit(EditAccountLoading());
    UserModel updateUser = UserModel(
        name: nameController.text,
        email: emailController.text,
        mobile: phoneController.text);
    Map<String, dynamic> data = updateUser.toJson();
    LoggerHelper.info(data.toString());
    var result = await getIt.get<EditAccountRepo>().editAccount(data);
    result.fold((error) {
      emit(EditAccountFailure(errMessage: error.errMassage));
    }, (edited) async {
      await updateCached();
      emit(EditAccountSuccess());
    });
  }
}
