import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/account/data/models/order_model/order_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderModel>> getAllMyOrder();
}
