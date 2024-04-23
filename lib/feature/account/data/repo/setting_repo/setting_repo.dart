import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/account/data/models/setting_model/setting_model.dart';
import 'package:dartz/dartz.dart';

abstract class SettingRepo {
  Future<Either<Failure, Setting>> getSetting();
}
