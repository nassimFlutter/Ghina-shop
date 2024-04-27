import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/account/data/models/static_page_model/static_page_model.dart';
import 'package:dartz/dartz.dart';

abstract class StaticPageRepo {
  Future<Either<Failure, StaticPage>> getStaticPage(int pageId);
}
