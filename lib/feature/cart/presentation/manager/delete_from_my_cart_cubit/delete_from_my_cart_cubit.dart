import 'package:best_price/core/errors/failures.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/cart/data/repos/cart_repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delete_from_my_cart_state.dart';

class DeleteFromMyCartCubit extends Cubit<DeleteFromMyCartState> {
  DeleteFromMyCartCubit() : super(DeleteFromMyCartInitial());
  static DeleteFromMyCartCubit get(context) => BlocProvider.of(context);
  Future<void> deleteFromCart(int productId) async {
    emit(DeleteFromMyCartLoading());
    Either<Failure, String> result =
        await getIt.get<CartRepo>().deleteFromCart(productId);
    result.fold(
      (error) {
        emit(DeleteFromMyCartFailures(errMessage: error.errMassage));
      },
      (deleted) {
        emit(DeleteFromMyCartSuccess());
      },
    );
  }
}
