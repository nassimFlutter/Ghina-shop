import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/account/data/models/static_page_model.dart';
import 'package:best_price/feature/account/data/repo/static_page_repo/static_page_repo.dart';
import 'package:dartz/dartz.dart';

class StaticPageRepoImpl implements StaticPageRepo {
  @override
  Future<Either<Failure, StaticPage>> getStaticPage(int pageId) async {
    try {
      var response =
          await getIt.get<ApiService>().get(endPoint: "pages/$pageId");
      return right(StaticPage.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}
