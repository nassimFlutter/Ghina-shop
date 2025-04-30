import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/pruduct_details_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int id);
  Future<Either<Failure, String>> addRate(int productId, int rate);
}
