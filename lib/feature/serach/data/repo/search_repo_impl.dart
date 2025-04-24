import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/serach/data/repo/serach_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<Product>>> searchByName(
      String searchQuery) async {
    try {
      List<Product> searchResult = [];
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: "products/products?keyword=$searchQuery");
      for (var product in response["data"]['products']) {
        searchResult.add(Product.fromJson(product));
      }
      return right(searchResult);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
