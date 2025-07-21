import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/product_details/data/repo/product_details_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/home_model.dart';

part 'random_products_state.dart';

class RandomProductsCubit extends Cubit<RandomProductsState> {
  RandomProductsCubit() : super(RandomProductsInitial());
  Future<void> getRandomProducts() async {
    emit(RandomProductsLoading());
    var result = await getIt.get<ProductDetailsRepo>().getRandomProducts();
    result.fold((error) {
      print(error.errMassage);
      emit(RandomProductsFailure());
    }, (products) {
      emit(RandomProductsSuccess(products: products));
    });
  }
}
