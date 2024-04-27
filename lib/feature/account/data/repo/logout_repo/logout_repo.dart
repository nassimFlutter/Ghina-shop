import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutRepo {
  Future<Either<Failure, Response>> logOut(Map<String,dynamic> data);
}
