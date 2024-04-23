import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/cart/data/models/cart_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getMyCart();
  Future<Either<Failure, String>> deleteFromCart(int productId);
  Future<Either<Failure, String>> changeQuantityFromCart(
      Map<String, dynamic> data);
}
