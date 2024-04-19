import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/brands/data/model/brand_model.dart';
import 'package:best_price/feature/brands/data/model/product_brands_model.dart';
import 'package:best_price/feature/brands/data/repo/brand_repo.dart';
import 'package:dartz/dartz.dart';

class BrandRepoImpl implements BrandRepo {
  @override
  Future<Either<Failure, BrandResponse>> fetchAllBrands() async {
    try {
      dynamic response =
          await getIt.get<ApiService>().get(endPoint: UrlKeys.brandsEndPoint);
      final brandResponse = BrandResponse.fromJson(response);
      if (response != null) {
        return right(brandResponse);
      } else {
        return left(ServerFailure('No data found', 404));
      }
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<Failure, ProductBrandsResponse>> fetchProductsByBrandId(
      int brandId) async {
    try {
      dynamic response = await getIt
          .get<ApiService>()
          .get(endPoint: "${UrlKeys.brandsEndPoint}/$brandId");
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
