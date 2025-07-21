import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/auth/sign_up/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignUprRepo {
  Future<Either<Failure, Tuple2<bool, String>>> signUp(UserModel user);
  Future<Either<Failure, String>> verificationCode(
      String phoneNumber, String code);
}
