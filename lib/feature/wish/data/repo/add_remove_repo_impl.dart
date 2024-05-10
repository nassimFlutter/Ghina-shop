import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/wish/data/models/add_remove_response_model.dart';
import 'package:best_price/feature/wish/data/repo/add_remove_repo.dart';
import 'package:dartz/dartz.dart';

class AddRemoveFromFavoriteRepoImpl implements AddRemoveFromFavoriteRepo {
  @override
  Future<Either<Failure, AddAndRemoveFromFavoriteResponse>>
      addAndRemoveFromFavorite(int productId) async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: "${UrlKeys.addRemoveFromFavEndPoint}/$productId");
      return right(AddAndRemoveFromFavoriteResponse.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
