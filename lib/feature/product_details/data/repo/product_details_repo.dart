import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/pruduct_details_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int id);
}
