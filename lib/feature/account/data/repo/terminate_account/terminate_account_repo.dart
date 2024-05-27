import 'package:best_price/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TerminateAccountRepo {
  Future<Either<Failure, String>> deleteAccount();
}
