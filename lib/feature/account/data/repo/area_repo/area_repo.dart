import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/account/data/models/area_model/area_model.dart';
import 'package:dartz/dartz.dart';

abstract class AreaRepo {
  Future<Either<Failure, List<Item>>> getAllArea();
}
