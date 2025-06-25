import 'dart:developer';

import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/stores/data/models/store_response.dart';
import 'package:best_price/feature/stores/data/repo/store_repo.dart';
import 'package:dartz/dartz.dart';

class StoreRepoImpl implements StoreRepo {
  @override
  Future<Either<Failure, StoreResponse>> getAllStore() async {
    try {
      var response =
          await getIt.get<ApiService>().get(endPoint: "users/sellers");
      return right(StoreResponse.fromJson(response));
    } catch (e) {
      return left(
        ErrorHandler.handleError(e),
      );
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProductsForStore(
      int storeId) async {
    try {
      log("This Store Id $storeId");
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: "/products/seller/$storeId/products");
      List<Product> productsList = [];
      for (var element in response['data']['products']) {
        productsList.add(Product.fromJson(element));
      }
      return right(productsList);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
