import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/home/data/models/home_model.dart';
import 'package:best_price/feature/stores/data/repo/store_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_products_for_store_state.dart';

class GetAllProductsForStoreCubit extends Cubit<GetAllProductsForStoreState> {
  GetAllProductsForStoreCubit() : super(GetAllProductsForStoreInitial());
  Future<void> getAllProductForStore(int storeId) async {
    emit(GetAllProductsForStoreLoading());
    var result = await getIt.get<StoreRepo>().getAllProductsForStore(storeId);
    result.fold(
      (l) {
        emit(GetAllProductsForStoreFailures(errMessage: l.errMassage));
      },
      (r) {
        emit(GetAllProductsForStoreSuccess(products: r));
      },
    );
  }
}
