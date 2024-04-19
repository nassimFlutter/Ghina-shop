import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EditAccountRepoImpl implements EditAccountRepo {
  @override
  Future<Either<Failure, String>> editAccount(Map<String, dynamic> data) async {
    try {
      await getIt.get<ApiService>().post(endPoint: "", data: data);
      return right("edited");
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
