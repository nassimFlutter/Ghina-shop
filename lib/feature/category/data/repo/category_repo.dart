import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/category/data/models/category_mode.dart';
import 'package:best_price/feature/category/data/models/product_categort_mode.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryResponse>> fetchAllCategory();
  Future<Either<Failure, ProductCategoryResponse>> getProductByCategoryId(
      int categoryId);
  Future<Either<Failure, ProductCategoryResponse>> searchProductCategory(
      String name, String category);
}
