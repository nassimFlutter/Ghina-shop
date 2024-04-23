import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/setting_model/setting_model.dart';
import 'package:best_price/feature/account/data/repo/setting_repo/setting_repo.dart';
import 'package:dartz/dartz.dart';

class SettingRepoImpl implements SettingRepo {
  @override
  Future<Either<Failure, Setting>> getSetting() async {
    try {
      var response = await getIt.get<ApiService>().get(endPoint: "getSettings");
      return right(Setting.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
