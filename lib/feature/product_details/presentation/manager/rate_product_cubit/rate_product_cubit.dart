import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/product_details/data/repo/product_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'rate_product_state.dart';

class RateProductCubit extends Cubit<RateProductState> {
  RateProductCubit() : super(RateProductInitial());
  Future<void> addRate(
    BuildContext context,
    int productId,
    int rate,
  ) async {
    emit(RateProductLoading());
    Either<Failure, String> result =
        await getIt.get<ProductDetailsRepo>().addRate(productId, rate);
    result.fold(
      (l) {
        emit(RateProductFailures(errMessage: l.errMassage));
      },
      (r) {
        emit(RateProductSuccess());
      },
    );
  }
}
