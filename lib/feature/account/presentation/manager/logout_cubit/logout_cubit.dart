import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/logout_repo/logout_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  Response logoutResponse = Response(status: false);
  static LogoutCubit get(context) => BlocProvider.of(context);
  Future<void> logout() async {
    emit(LogoutLoading());
    var result = await getIt.get<LogoutRepo>().logOut({});
    result.fold((error) {
      emit(LogoutFailures(errMessage: error.errMassage));
    }, (logout) async {
      logoutResponse = logout;
      await HelperFunctions.clearUserData();
      emit(LogoutSuccess());
    });
  }
}
