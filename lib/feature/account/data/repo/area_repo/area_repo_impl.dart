import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/area_model/area_model.dart';
import 'package:best_price/feature/account/data/repo/area_repo/area_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class AreaRepoImpl implements AreaRepo {
  @override
  Future<Either<Failure, List<Item>>> getAllArea() async {
    try {
      List<Item> allArea = [];
      var response =
          await getIt.get<ApiService>().get(endPoint: UrlKeys.getAreaEndPoint);
      for (var area in response["items"]) {
        allArea.add(Item.fromJson(area));
      }
      return right(allArea);
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
