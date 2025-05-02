import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/stores/data/models/store_response.dart';
import 'package:dartz/dartz.dart';

abstract class StoreRepo {
  Future<Either<Failure, StoreResponse>> getAllStore();
  Future<Either<Failure, List<Product>>> getAllProductsForStore(int storeId);
}
