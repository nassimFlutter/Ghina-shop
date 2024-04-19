import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/brands/data/model/brand_model.dart';
import 'package:best_price/feature/brands/data/repo/brand_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());
  BrandResponse brandResponse = BrandResponse();
  static BrandsCubit get(context) => BlocProvider.of(context);
  Future<void> fetchAllBrands() async {
    emit(BrandsLoading());
    var result = await getIt.get<BrandRepo>().fetchAllBrands();
    result.fold((error) {
      emit(BrandsFailure(errMessage: error.errMassage));
    }, (fetchedBrand) {
      brandResponse = fetchedBrand;
      emit(BrandsSuccess());
    });
  }
}
