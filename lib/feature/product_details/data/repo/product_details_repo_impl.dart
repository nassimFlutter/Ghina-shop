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
}
