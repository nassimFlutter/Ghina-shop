import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/stores/data/models/store_response.dart';
import 'package:best_price/feature/stores/data/repo/store_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_stores_state.dart';

class GetAllStoresCubit extends Cubit<GetAllStoresState> {
  GetAllStoresCubit() : super(GetAllStoresInitial());
  static GetAllStoresCubit get(context) => BlocProvider.of(context);
  Future<void> getAllStores() async {
    emit(GetAllStoresLoading());
    var result = await getIt.get<StoreRepo>().getAllStore();
    result.fold(
      (l) {
        emit(GetAllStoresFailures(errMessage: l.errMassage));
      },
      (r) {
        emit(GetAllStoresSuccess(stores: r));
      },
    );
  }
}
