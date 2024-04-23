import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:best_price/feature/cart/data/repos/cart_repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepoImpl implements CartRepo {
  @override
  Future<Either<Failure, CartModel>> getMyCart() async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: UrlKeys.getMyCartEndPoint);
      return right(CartModel.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
