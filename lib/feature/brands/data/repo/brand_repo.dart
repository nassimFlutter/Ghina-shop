import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/brands/data/model/brand_model.dart';
import 'package:dartz/dartz.dart';

import '../model/product_brands_model.dart';

abstract class BrandRepo {
  Future<Either<Failure, BrandResponse>> fetchAllBrands();
  Future<Either<Failure, ProductBrandsResponse>> fetchProductsByBrandId(int brandId);
}
