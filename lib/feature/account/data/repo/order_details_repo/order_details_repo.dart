import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/account/data/models/orders_details/order_details_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderDetailsRepo {
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(int orderId); 
}
