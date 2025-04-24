import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/repo/chnage_password_repo/change_password_repo.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  @override
  Future<Either<Failure, String>> changeMyPassword(
      Map<String, dynamic> data) async {
    try {
      await getIt
          .get<ApiService>()
          .post(endPoint: UrlKeys.changePassEndPoint, data: data);

      return right("Ok");
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
