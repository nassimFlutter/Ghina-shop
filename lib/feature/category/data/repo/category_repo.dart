import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/category/data/models/category_mode.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryResponse>> fetchAllCategory();
  Future<Either<Failure, List<Product>>> getProductByCategoryId(int categoryId);
  Future<Either<Failure, List<Product>>> getProductByCategoryIdWithPagination({
    required int categoryId,
    required int page,
    int limit = 10,
  });
  Future<Either<Failure, List<Product>>> searchProductCategory(
      String name, String category);
}
