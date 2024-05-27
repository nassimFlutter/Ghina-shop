import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/orders_details/order_details_model.dart';
import 'package:best_price/feature/account/data/repo/order_details_repo/order_details_repo.dart';
import 'package:dartz/dartz.dart';

class OrderDetailsRepoImpl implements OrderDetailsRepo {
  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
      int orderId) async {
    try {
      var result = await getIt
          .get<ApiService>()
          .get(endPoint: "${UrlKeys.getOrdersByIdEndPoint}/$orderId");
      return right(OrderDetailsModel.fromJson(result));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
