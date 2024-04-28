import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/edit_account_repo/edit_account_repo.dart';
import 'package:dartz/dartz.dart';

class EditAccountRepoImpl implements EditAccountRepo {
  @override
  Future<Either<Failure, Response>> editAccount(
      Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> response = await getIt
          .get<ApiService>()
          .post(endPoint: UrlKeys.editAccountEndPoint, data: data);
      return right(Response.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
