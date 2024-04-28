import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:best_price/feature/account/data/repo/order_repo/order_repo.dart';
import 'package:dartz/dartz.dart';

class OrderRepoImpl implements OrderRepo {
  @override
  Future<Either<Failure, OrderModel>> getAllMyOrder() async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: UrlKeys.getOrdersEndPoint);
      return right(OrderModel.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
