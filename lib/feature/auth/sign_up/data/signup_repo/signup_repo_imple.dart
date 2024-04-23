import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:best_price/feature/auth/sign_up/data/signup_repo/signup_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepoImpl implements SignUprRepo {
  @override
  Future<Either<Failure, Tuple2<bool, String>>> signUp(UserModel user) async {
    try {
      var response = await getIt.get<ApiService>().post(
            endPoint: "signUp",
            data: user.toJson(),
            isLogin: true,
          );

      String? message;
      bool status = response['status'];
      //! handel message from backEnd
      if (response['message'] != null) {
        message = response['message'];
      }
      //! handel statue ....
      if (status) {
        if (response[user] != null) {
          await cacheUserInfo(response['user']);
        }
      }
      return right(Tuple2<bool, String>(status, message ?? ""));
    } catch (e) {
      if (e is DioException) {
        LoggerHelper.error(' ########### Dio Exception #################');
        LoggerHelper.error(e.message ?? "");
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString(), 500));
    }
  }
}
