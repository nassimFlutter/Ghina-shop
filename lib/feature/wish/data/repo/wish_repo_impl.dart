import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/wish/data/models/my_wish_model.dart';
import 'package:best_price/feature/wish/data/repo/wish_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WishRepoImpl implements WishRepo {
  @override
  Future<Either<Failure, MyWishModel>> getMyWish(
      {CancelToken? cancelToken}) async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: UrlKeys.getMyWishEndPoint, cancelToken: cancelToken);

      return right(MyWishModel.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
