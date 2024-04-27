import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/keys.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:best_price/feature/account/data/repo/address_repo/address_repo.dart';
import 'package:dartz/dartz.dart';

class AddressRepoImpl implements AddressRepo {
  @override
  Future<Either<Failure, AddressModel>> getAllAddress() async {
    try {
      var response = await getIt
          .get<ApiService>()
          .get(endPoint: UrlKeys.getMyAddressEndPoint);
      if (response['status']) {
        return right(AddressModel.fromJson(response));
      } else {
        return left(ErrorHandler.handleError("No Data 404"));
      }
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
