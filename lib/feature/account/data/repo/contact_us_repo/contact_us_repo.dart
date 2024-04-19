import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, Response>> contactUs(
      String email, String mobile, String name, String message);
}