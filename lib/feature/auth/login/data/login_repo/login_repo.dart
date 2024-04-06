import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, Tuple2<bool, String>>> login(UserModel user);
}
