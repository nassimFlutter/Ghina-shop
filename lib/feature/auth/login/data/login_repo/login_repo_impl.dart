import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/cache/cache_helper.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/auth/login/data/login_repo/login_repo.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, Tuple2<bool, String>>> login(UserModel user) async {
    try {
      var response = await getIt
          .get<ApiService>()
          .post(endPoint: "login", data: user.toJson());
      String? message;
      bool status = response['status'];

      if (response['message'] != null) {
        message = response['message'];
      }
      if (status) {
        if (response["user"] != null) {
          await cacheUserInfo(response['user']);
        }
      }
      await CacheHelper.setData(key: Keys.kIsFirstTime, value: true);
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
