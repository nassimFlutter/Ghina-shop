import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/category/data/models/category_mode.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
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
  Future<Either<Failure, List<Product>>> getProductByCategoryId(
      int categoryId) async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: "products/categories/$categoryId/products");

      if (response != null) {
        List<Product> allProduct = [];
        for (var element in response["data"]["products"]) {
          allProduct.add(Product.fromJson(element));
        }
        return right(allProduct);
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
  Future<Either<Failure, List<Product>>> getProductByCategoryIdWithPagination({
    required int categoryId,
    required int page,
    int limit = 10,
  }) async {
    try {
      var response = await getIt.get<ApiService>().get(
          endPoint:
              "products/categories/$categoryId/products?page=$page&limit=$limit");

      if (response != null) {
        List<Product> allProduct = [];
        for (var element in response["data"]["products"]) {
          allProduct.add(Product.fromJson(element));
        }
        return right(allProduct);
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
  Future<Either<Failure, List<Product>>> searchProductCategory(
      String name, String category) async {
    try {
      List<Product> fetchProduct = [];
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: "${UrlKeys.searchEndPoint}$name&category=$category");
      for (var element in response) {
        fetchProduct.add(Product.fromJson(element));
      }
      return right(fetchProduct);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
