import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/setting_model/setting_model.dart';
import 'package:best_price/feature/account/data/repo/setting_repo/setting_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'setting_cubit_state.dart';

class SettingCubitCubit extends Cubit<SettingCubitState> {
  SettingCubitCubit() : super(SettingCubitInitial());
  Setting setting = Setting();
  Future<void> getSetting() async {
    emit(SettingCubitLoading());
    var result = await getIt.get<SettingRepo>().getSetting();
    result.fold((error) {
      emit(SettingCubitFailure(errMessage: error.errMassage));
    }, (allSetting) {
      setting = allSetting;
      emit(SettingCubitSuccess());
    });
  }
}
