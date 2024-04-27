import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/logout_repo/logout_repo.dart';
import 'package:dartz/dartz.dart';

class LogoutRepoImpl implements LogoutRepo {
  @override
  Future<Either<Failure, Response>> logOut(Map<String, dynamic> data) async {
    try {
      var response = await getIt
          .get<ApiService>()
          .post(endPoint: UrlKeys.logoutEndPoint, data: data);
      return right(Response.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
