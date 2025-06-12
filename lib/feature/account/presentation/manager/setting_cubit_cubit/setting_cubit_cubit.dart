import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/setting_model/setting_model.dart';
import 'package:best_price/feature/account/data/repo/setting_repo/setting_repo.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'setting_cubit_state.dart';

class SettingCubitCubit extends Cubit<SettingCubitState> {
  SettingCubitCubit() : super(SettingCubitInitial());
  Setting setting = Setting();
  String whatsAppNumber = '+963931451710';
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

  Future<void> getLinks() async {
    emit(SettingCubitLoading());
    var result = await getIt.get<StaticPageRepo>().getLinks();
    result.fold(
      (error) {
        emit(SettingCubitFailure(errMessage: error.errMassage));
      },
      (r) {
        emit(SettingCubitSuccess());
        whatsAppNumber = r.data?.socialLinks?.whatsApp ?? "";
      },
    );
  }
}
