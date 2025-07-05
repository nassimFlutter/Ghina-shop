import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/user_info_model.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());
  final StaticPageRepo _staticPageRepo = getIt<StaticPageRepo>();
  static GetUserInfoCubit get(context) => BlocProvider.of(context);
  Future<void> getUserInfo() async {
    emit(GetUserInfoLoading());
    final result = await _staticPageRepo.getUserInfo();
    result.fold(
      (failure) => emit(GetUserInfoFailure(error: failure.errMassage)),
      (userInfo) => emit(GetUserInfoSuccess(userInfo: userInfo)),
    );
  }
}
