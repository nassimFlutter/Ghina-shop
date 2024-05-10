import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/wish/data/repo/add_remove_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_and_remove_from_favorite_state.dart';

class AddAndRemoveFromFavoriteCubit
    extends Cubit<AddAndRemoveFromFavoriteState> {
  AddAndRemoveFromFavoriteCubit() : super(AddAndRemoveFromFavoriteInitial());
  AddAndRemoveFromFavoriteCubit get(context) => BlocProvider.of(context);
  Future<void> addAndRemoveFromFavorite(int productId) async {
    emit(AddAndRemoveFromFavoriteLoading());
    var result = await getIt
        .get<AddRemoveFromFavoriteRepo>()
        .addAndRemoveFromFavorite(productId);
    result.fold((error) {
      emit(AddAndRemoveFromFavoriteFailures(errMessage: error.errMassage));
    }, (addOrRemove) {
      emit(AddAndRemoveFromFavoriteSuccess(
          successMessage: addOrRemove.operation ?? ""));
    });
  }

  void toggleFavorite(Product product, List<Product> productList) {
    final index = productList.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      productList[index] = product.copyWith(isFavorite: '0');
      // Notify listeners or update UI accordingly
    }
  }
}
