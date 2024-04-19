import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/featured_products/data/featured_producte_repo/featured_producte_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

class FeaturedProductsRepoImpl implements FeaturedProductRepo {
  @override
  Future<Either<Failure, List<Product>>> getFeaturedProducts() async {
    try {
      var response =
          await getIt.get<ApiService>().get(endPoint: "getFeaturedProducts");
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
