import 'package:best_price/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, Tuple2<bool, String>>> generateForgetPasswordToken(
      String email);
}
