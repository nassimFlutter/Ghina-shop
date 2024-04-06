import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/category/data/models/category_mode.dart';
import 'package:best_price/feature/category/data/models/product_categort_mode.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<Either<Failure, CategoryResponse>> fetchAllCategory() async {
    try {
      var response =
          await getIt.get<ApiService>().get(endPoint: UrlKeys.categoryEndPoint);
      if (response != null) {
        return right(CategoryResponse.fromJson(response));
      } else {
        return left(ServerFailure('No data found', 404));
      }
    } catch (e) {
      if (e is DioException) {
        LoggerHelper.error(' ########### Dio Exception #################');
        LoggerHelper.error(e.message ?? "");
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString(), 500));
    }
  }

  @override
  Future<Either<Failure, ProductCategoryResponse>> getProductByCategoryId(
      int categoryId) async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: "${UrlKeys.productCategoryEndPoint}/$categoryId");
      if (response != null) {
        return right(ProductCategoryResponse.fromJson(response));
      } else {
        return left(ServerFailure('No data found', 404));
      }
    } catch (e) {
      if (e is DioException) {
        LoggerHelper.error(' ########### Dio Exception #################');
        LoggerHelper.error(e.message ?? "");
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString(), 500));
    }
  }
}
