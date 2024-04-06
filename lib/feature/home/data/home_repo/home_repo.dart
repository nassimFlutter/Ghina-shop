import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,HomeApiResponse>> getHomePage();
}
