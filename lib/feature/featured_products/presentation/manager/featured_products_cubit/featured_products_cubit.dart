import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/featured_products/data/featured_producte_repo/featured_producte_repo.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  FeaturedProductsCubit() : super(FeaturedProductsInitial());
  static FeaturedProductsCubit get(context) => BlocProvider.of(context);
  List<Product> allFeaturedProducts = [];
  Future<void> getFeaturedProducts() async {
    emit(FeaturedProductsLoading());
    var result = await getIt.get<FeaturedProductRepo>().getFeaturedProducts();
    result.fold((error) {
      emit(FeaturedProductsFailure(errMessage: error.errMassage));
    }, (getFeaturedProducts) {
      allFeaturedProducts = getFeaturedProducts;
      emit(FeaturedProductsSuccess());
    });
  }
}
