import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/product_details/data/repo/product_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/service_locator.dart';
import '../model/pruduct_details_model.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(int id) async {
    try {
      var result =
          await getIt.get<ApiService>().get(endPoint: "/products/product/$id");
      if (result != null) {
        return right(ProductDetailsModel.fromJson(result));
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
  Future<Either<Failure, String>> addRate(int productId, int rate) async {
    try {
      await getIt.get<ApiService>().post(
        endPoint: "products/rate",
        data: {
          "productId": productId,
          "rating": rate,
        },
      );
      return right("تم تقيم المنتج بنجاح");
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getRandomProducts() async {
    try {
      var result = await getIt
          .get<ApiService>()
          .get(endPoint: "products/flash-products");
      if (result != null) {
        List<Product> allProduct = [];
        for (var element in result["data"]) {
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
}
    // {
    // "productId": 17,
    // "rating":2
    
    // }
