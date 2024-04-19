import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/brands/data/model/product_brands_model.dart';
import 'package:best_price/feature/brands/data/repo/brand_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_brands_state.dart';

class ProductBrandsCubit extends Cubit<ProductBrandsState> {
  ProductBrandsCubit() : super(ProductBrandsInitial());
  static ProductBrandsCubit get(context) => BlocProvider.of(context);
  ProductBrandsResponse productBrandsResponse =
      ProductBrandsResponse(); //? this form model in brands folder
  Future<void> fetchProductByBrandsId(int brandId) async {
    emit(ProductBrandsLoading());
    var result = await getIt.get<BrandRepo>().fetchProductsByBrandId(brandId);
    result.fold((error) {
      emit(ProductBrandsFailure(errMessage: error.errMassage));
    }, (productForOneBrand) {
      productBrandsResponse = productForOneBrand;
      emit(ProductBrandsSuccess());
    });
  }
}
