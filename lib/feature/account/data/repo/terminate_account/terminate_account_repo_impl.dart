import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/terminate_account/terminate_account_repo.dart';
import 'package:dartz/dartz.dart';

class TerminateAccountRepoImpl implements TerminateAccountRepo {
  @override
  Future<Either<Failure, String>> deleteAccount() async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: UrlKeys.terminateEndPoint);
      return right("");
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
