import 'package:best_price/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../home/data/models/home_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Product>>> searchByName(String searchQuery);
}
