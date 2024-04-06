import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/auth/forget_password/data/forget_password_repo/forget_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  @override
  Future<Either<Failure, Tuple2<bool, String>>> generateForgetPasswordToken(
      String email) async {
    try {
      dynamic response = await getIt
          .get<ApiService>()
          .get(endPoint: "sendResetPasswordEmail/?email=$email");
      bool? status;
      String? message;
      if (response['status'] != null) {
        status = response['status'];
      }
      if (response['message'] != null) {
        message = response['message'];
      }
      return right(Tuple2<bool, String>(status ?? false, message ?? ""));
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
