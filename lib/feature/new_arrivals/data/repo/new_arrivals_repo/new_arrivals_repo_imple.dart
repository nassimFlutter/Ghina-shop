import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/new_arrivals/data/repo/new_arrivals_repo/new_arrivals_repo.dart';
import 'package:dartz/dartz.dart';

class NewArrivalsProductsRepoImpl implements NewArrivalsProductsRepo {
  @override
  Future<Either<Failure, List<Product>>> getNewArrivalsProducts() async {
    try {
      var response =
          await getIt.get<ApiService>().get(endPoint: "getNewestProducts");
      List<Product> productsList = [];
      for (var element in response) {
        productsList.add(Product.fromJson(element));
      }
      return right(productsList);
    } catch (e) {
    return left(ErrorHandler.handleError(e));
    }
  }
}
