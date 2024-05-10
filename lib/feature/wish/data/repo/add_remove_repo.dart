import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/wish/data/models/add_remove_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AddRemoveFromFavoriteRepo {
  Future<Either<Failure, AddAndRemoveFromFavoriteResponse>>
      addAndRemoveFromFavorite(int productId);
}
