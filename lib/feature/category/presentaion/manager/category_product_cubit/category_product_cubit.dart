import 'package:best_price/core/api/api_service.dart';
import 'package:best_price/core/utils/logger.dart';
import 'package:best_price/core/utils/service_locator.dart';
import 'package:best_price/feature/category/data/models/product_categort_mode.dart';
import 'package:best_price/feature/category/data/repo/category_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit() : super(CategoryProductInitial());
  static CategoryProductCubit get(context) => BlocProvider.of(context);
  ProductCategoryResponse productCategoryResponse = ProductCategoryResponse();
  Future<void> fetchProductByCategoryId(int categoryId) async {
    emit(CategoryProductLoading());
    var result =
        await getIt.get<CategoryRepo>().getProductByCategoryId(categoryId);
    result.fold((error) {
      LoggerHelper.error(error.errMassage);
      emit(CategoryProductFailure(errMessage: error.errMassage));
    }, (fetchedProduct) {
      productCategoryResponse = fetchedProduct;
      emit(CategoryProductSuccess());
    });
  }
}
