import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/flitter_sort/data/repo/filter_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FilterRepoImpl extends FilterRepo {
  @override
  Future<Either<Failure, List<Product>>> postFilter(
      {required String query}) async {
    try {
      var result =
          await getIt.get<ApiService>().get(endPoint: "productsFilter/$query");

      List<Product> listData = [];
      for (var element in result) {
        listData.add(Product.fromJson(element));
      }
      return right(listData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString(), 500));
    }
  }
}
