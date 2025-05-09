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
          .post(endPoint: "auth/login", data: user.toJson());

      if (response["result"] != null) {
        await cacheUserInfo(response['result']);
      }
      if (response['token'] != null && response['token'] is String) {
        await CacheHelper.setData(
            key: Keys.kUserToken, value: response['token']);
      }
      await CacheHelper.setData(key: Keys.kIsFirstTime, value: true);
      return right(const Tuple2<bool, String>(true, "تم التسجيل بنجاح"));
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
