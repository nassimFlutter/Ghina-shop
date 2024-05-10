import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/wish/data/models/my_wish_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class WishRepo {
  Future<Either<Failure, MyWishModel>> getMyWish({CancelToken? cancelToken});
}
