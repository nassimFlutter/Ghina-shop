import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, Response>> changeMyPassword(Map<String, dynamic> data);
}
