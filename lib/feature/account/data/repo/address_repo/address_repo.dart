import 'package:best_price/core/api/api_response_model.dart';
import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/feature/account/data/models/address_model/address_model.dart';
import 'package:dartz/dartz.dart';

abstract class AddressRepo {
  Future<Either<Failure, AddressModel>> getAllAddress();
  Future<Either<Failure, String>> addAddress(Map<String,dynamic>data);
  Future<Either<Failure, Response>> deleteAddress(int addressId);
}
